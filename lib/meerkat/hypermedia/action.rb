require 'uri'

module Meerkat
  module Hypermedia
    class Action
      attr_reader :uri

      def initialize(link)
        @uri = URI(link)
      end

      def follow
        Meerkat::API.new(endpoint: "http://#{@uri.host}").get(@uri.path)
      end
    end
  end
end
