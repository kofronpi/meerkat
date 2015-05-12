module Meerkat
  # Allow Meerkat client user configuration
  module Configuration
    VALID_OPTIONS_KEYS = [:api_key, :endpoint, :user_agent, :api_version].freeze
    DEFAULT_USER_AGENT = "Meerkat Ruby Gem #{Meerkat::VERSION}".freeze

    attr_accessor(*VALID_OPTIONS_KEYS)
    alias_method :api_token=, :api_key=

    # Reset config when module is extended
    def self.extended(base)
      base.reset
    end

    def reset
      self.api_version = '1.0'
      self.api_key = ENV['MEERKAT_API_KEY'] || ENV['MEERKAT_API_TOKEN']
      self.user_agent = DEFAULT_USER_AGENT
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
