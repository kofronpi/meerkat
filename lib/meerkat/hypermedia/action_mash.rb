require 'meerkat/base'
require 'meerkat/hypermedia/action'

module Meerkat
  module Hypermedia
    class ActionMash < Meerkat::Base
      def initialize(hash)
        hash.each do |k,v|
          hash[k] = Action.new(v)
        end
        super(hash)
      end
    end
  end
end