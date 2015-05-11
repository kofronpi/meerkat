module Meerkat
  # @private
  class API < Request
    # @private
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
    # @private
    alias_method :api_token=, :api_key=

    # Creates a new API.
    # @raise [Error:MissingCredentials]
    def initialize(options={})
      options = Meerkat.options.merge(options)
      (Configuration::VALID_OPTIONS_KEYS + [:api_key]).each do |key|
        send("#{key}=", options[key]) if options[key]
      end
    end
  end
end
