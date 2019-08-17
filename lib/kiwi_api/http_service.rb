# frozen_string_literal: true

module KiwiApi
  class HttpService
    def initialize
      @api_key = KiwiApi.api_key
    end

    def connection
      @connection ||= begin
        Faraday.new(url: "https://kiwicom-prod.apigee.net") do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.headers["apikey"] = @api_key
        end
      end
    end

    def request_get(url, params)
      connection.get do |req|
        req.url url
        req.params = params
      end
    end
  end
end
