require 'meerkat/version'
require 'meerkat/configuration'
require 'meerkat/channel_methods'
require 'meerkat/request'
require 'meerkat/api'
require 'meerkat/client'
require 'meerkat/error'

module Meerkat
  extend Configuration
  extend ChannelMethods

  # Alias for Meerkat::Client.new
  #
  # @return [Meerkat::Client]
  def self.client(options={})
    Meerkat::Client.new(options)
  end

  # Delegate to Meerkat::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client(endpoint: 'https://resources.meerkatapp.co').send(method, *args, &block)
  end

  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
