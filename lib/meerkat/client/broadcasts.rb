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

      def activities(id, options = {})
        get("/broadcasts/#{id}/activities", query: options)
      end

      def watchers(id, options = {})
        get("/broadcasts/#{id}/watchers", query: options)
      end

      def summary(id, options = {})
        get("/broadcasts/#{id}/summary", query: options)
      end
    end
  end
end
