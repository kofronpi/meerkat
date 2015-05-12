module Meerkat
  class Client
    # Users resource API interaction
    module Users
      # Gets details about a Meerkat user.
      #
      # @example
      #   Meerkat.user_profile('54fb2e454d0000d23bb9c40f')
      #
      # @param [String] user id
      # @param  [Hash] options A customizable set of options.
      # @return [Array]
      def user_profile(id, options = {})
        get("/users/#{id}/profile", query: options)
      end
    end
  end
end
