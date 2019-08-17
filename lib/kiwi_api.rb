# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "json"
require "active_support/core_ext/hash"

require "kiwi_api/version"
require "kiwi_api/client"
require "kiwi_api/http_service"
require "kiwi_api/response"

module KiwiApi
  class << self
    attr_accessor :api_key
  end

  self.api_key = self.api_key || ENV["API_KEY"]
end
