module Meerkat
  module Utils
    module Rubyfier
      def convert_key(key) #:nodoc:
        underscore_string(key.to_s)
      end

      # converts a camel_cased string to a underscore string
      # Same way ActiveSupport does string.underscore
      def underscore_string(str)
        str.to_s.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          downcase
      end
    end
  end
end
