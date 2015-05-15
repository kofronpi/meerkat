require 'meerkat/base'
require 'meerkat/hypermedia/action_mash'

module Meerkat
  class BroadcastMash < Base
    attr_reader :actions
    def initialize(hash, actions = nil)
      unless actions.nil?
        @actions = Meerkat::Hypermedia::ActionMash.new(actions)
      end
      super(hash)
    end
  end
end
