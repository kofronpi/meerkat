module Meerkat
  class Client
    module Routes
      # API routes list Discovery.
      #
      # @example
      #   Meerkat.routes
      #
      # @return [Array] a raw JSON array of routes.
      def routes
        get('/routes')
      end
    end
  end
end
