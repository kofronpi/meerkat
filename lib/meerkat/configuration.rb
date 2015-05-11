require 'yaml'

module Meerkat
	module Configuration
		VALID_OPTIONS_KEYS = [:api_key].freeze

		attr_accessor(*VALID_OPTIONS_KEYS)
		alias_method :api_token=, :api_key=

		# Reset config when module is extended
		def self.extended(base)
			base.reset
		end

		def reset
			self.api_key = ENV['MEERKAT_API_KEY'] || ENV['MEERKAT_API_TOKEN']
		end

		# Convenience method to allow configuration options to be set in a block.
		def configure
			yield self
		end

		def options
			VALID_OPTIONS_KEYS.inject({}) do |option, key|
				option.merge!(key => send(key))
		 	end
		end
	end
end
