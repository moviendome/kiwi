# frozen_string_literal: true

module KiwiApi
  class Client
    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    def search(params = {})
      response = http_service.request_get("/v2/search", params)
      KiwiApi::Response.new(response)
    end

    def location(params = {})
      params.merge!(location_types: "airport")
      response = http_service.request_get("/locations/query", params)
      KiwiApi::Response.new(response)
    end
  end
end
