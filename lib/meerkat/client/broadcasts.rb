module Meerkat
  class Client
    # Broadcasts resource API interaction
    module Broadcasts
      # Gets a list of broadcasts currently live.
      #
      # @example
      #   Meerkat.broadcasts
      #
      # @param  [Hash] options A customizable set of options.
      # @return [Array]
      def broadcasts(options = {})
        get('/broadcasts', query: options)
      end
    end
  end
end
