require 'meerkat/user_mash'

module Meerkat
  class Client
    # Users resource API interaction
    module Users
      # Gets details about a Meerkat user.
      #
      # @example
      #   Meerkat.user('54fb2e454d0000d23bb9c40f')
      #
      # @param [String] user id
      # @param  [Hash] options A customizable set of options.
      # @return [Meerkat::UserMash]
      def user(id, options = {})
        perform_get_with_object("/users/#{id}/profile", Meerkat::UserMash, options)
      end
    end
  end
end
