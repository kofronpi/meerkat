module Meerkat
  class Client
    module Channels
      def likes(id, options = {})
        get("/broadcasts/#{id}/likes", query: options)
      end

      def restreams(id, options = {})
        get("/broadcasts/#{id}/restreams", query: options)
      end

      def comments(id, options = {})
        get("/broadcasts/#{id}/comments", Meerkat::User, options)
      end
    end
  end
end
