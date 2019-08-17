# frozen_string_literal: true

require "test_helper"
require "webmock/minitest"
require "vcr"

# https://stackoverflow.com/questions/9816152/filtering-sensitive-data-with-vcr
VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<API_KEY>') do |interaction|
    ENV["API_KEY"]
  end
end
