require 'meerkat/broadcast_mash'

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
      # @return [Array] a raw JSON array of broadcasts.
      def broadcasts(options = {})
        get('/broadcasts', query: options)
      end


      # Gets a list of broadcasts currently live.
      #
      # @example
      #   Meerkat.broadcasts
      #
      # @param [String] broadcast id
      # @param  [Hash] options A customizable set of options.
      # @return [Meerkat::BroadcastMash]
      def broadcast(id, options = {})
        perform_get_with_object("/broadcasts/#{id}/summary", Meerkat::BroadcastMash, options)
      end

      def activities(id, options = {})
        get("/broadcasts/#{id}/activities", query: options)
      end

      def watchers(id, options = {})
        get("/broadcasts/#{id}/watchers", query: options)
      end
    end
  end
end
