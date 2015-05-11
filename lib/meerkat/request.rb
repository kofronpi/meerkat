require 'httparty'

module Meerkat
  class Request
    include HTTParty
    format :json
    headers 'Accept' => 'application/json'

    attr_accessor :api_key, :endpoint, :api_version

    def get(path, options={})
      set_authorization_header(options)
      validate self.class.get(@endpoint + path, options)
    end

    # Checks the response code for common errors.
    # Returns parsed response for successful requests.
    def validate(response)
      case response.code
        when 400; raise Error::BadRequest.new error_message(response)
        when 401; raise Error::Unauthorized.new error_message(response)
        when 403; raise Error::Forbidden.new error_message(response)
        when 404; raise Error::NotFound.new error_message(response)
        when 405; raise Error::MethodNotAllowed.new error_message(response)
        when 409; raise Error::Conflict.new error_message(response)
        when 500; raise Error::InternalServerError.new error_message(response)
        when 502; raise Error::BadGateway.new error_message(response)
        when 503; raise Error::ServiceUnavailable.new error_message(response)
      end

      response.parsed_response
    end

    private

    # Sets Authorization header with api_key for requests, and api version.
    # See http://meerkatapp.co/developers#authentication
    # @raise [Error::MissingCredentials] if no api key is set
    def set_authorization_header(options, path=nil)
      raise Error::MissingCredentials.new("Please provide an api_key for user") unless @api_key
      options[:headers] = {'Authorization' => "Bearer #{@api_key}", "v" => "#{@api_version}"}
    end
  end
end
