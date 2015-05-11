module Meerkat
  # Wrapper for the Meerkat API.
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each {|f| require f}

    include Broadcasts
    #include Users
  end
end
