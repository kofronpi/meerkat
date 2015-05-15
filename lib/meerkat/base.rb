require 'hashie'
require 'meerkat/utils/rubyfier'

module Meerkat
  class Base < Hashie::Mash
    include Utils::Rubyfier

    protected

    def convert_value(val, duping=false) #:nodoc:
      obj = super
      obj = self.class.new(obj) if Hashie::Mash === obj
      obj
    end

    def initializing_reader(key)
      ck = convert_key(key)
      regular_writer(ck, self.class.new) unless key?(ck)
      regular_reader(ck)
    end
  end
end
