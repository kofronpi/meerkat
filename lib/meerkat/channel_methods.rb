module Meerkat
  # Special methods to extend to Meerkat module
  module ChannelMethods
    # Delegate these methods to a different Meerkat::Client endpoint
    ['likes', 'restreams', 'comments'].each do |method|
      define_method(method) do |args|
        client(endpoint: 'https://channels.meerkatapp.co')  \
          .send(method, *args)
      end
    end
  end
end
