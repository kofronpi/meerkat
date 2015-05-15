require 'httparty'
module Meerkat
  # Class encapsulating HTTP requests behavior
  class Request
    include HTTParty
    format :json
    headers 'Accept' => 'application/json'
    default_params v: "#{@api_version}"

    attr_accessor :api_key, :endpoint, :api_version

    def perform_get_with_object(path, klass, options = {})
      response = get(path, options)
      klass.new(response['result'], response['followupActions'])
    end

    def get(path, options = {})
      authorization_header(options)
      validate self.class.get(@endpoint + path, options)
    end

    private

    # Checks the response code for common errors.
    # Returns parsed response for successful requests.
    def validate(response)
      case response.code
      when 400 then fail(Error::BadRequest.new, error_message(response))
      when 401 then fail(Error::Unauthorized.new, error_message(response))
      when 403 then fail(Error::Forbidden.new, error_message(response))
      when 404 then fail(Error::NotFound.new, error_message(response))
      when 405 then fail(Error::MethodNotAllowed.new, error_message(response))
      when 409 then fail(Error::Conflict.new, error_message(response))
      when 500 then fail(Error::InternalServerError.new, error_message(response))
      when 502 then fail(Error::BadGateway.new, error_message(response))
      when 503 then fail(Error::ServiceUnavailable.new, error_message(response))
      end
      response.parsed_response
    end

    # Sets Authorization header with api_key for requests, and api version.
    # See http://meerkatapp.co/developers#authentication
    # @raise [Error::MissingCredentials] if no api key is set
    def authorization_header(options)
      fail(Error::MissingCredentials.new, 'Please provide an api_key for user') unless @api_key
      options[:headers] = { 'Authorization' => "#{@api_key}" }
    end

    def error_message(response)
      "Server responded with code #{response.code}, message: " \
      "#{response.parsed_response}. " \
      "Request URI: #{response.request.base_uri}#{response.request.path}"
    end
  end
end
