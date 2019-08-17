# frozen_string_literal: true

require "net_test_helper"

describe KiwiApi::Client do
  let(:client) { KiwiApi::Client.new }

  describe "initialize client" do
    it "returns error if no token" do
      skip
      VCR.use_cassette("kiwi_api/invalid-token", record: :new_episodes) do
        response = client_invalid_api_key.search

        assert !response.success?
        assert_equal 401, response.status
        assert_equal "Unauthorized", response.errors
      end
    end
  end

  describe "#search" do
    it "returns a error message if no params" do
      VCR.use_cassette("kiwi_api/empty-params") do
        params = {}

        response = client.search(params)

        assert !response.success?
        assert_equal 400, response.status
        assert_equal "Bad Request", response.errors.message
        assert_equal "fly_from", response.errors.full_messages.first.param
        assert_match "Field fly_from cannot be anywhere or unspecified when fly_to is either anywhere or unspecified.", response.errors.full_messages.first.errors.to_s
      end
    end

    it "returns a error message if no location" do
      VCR.use_cassette("kiwi_api/invalid-from") do
        params = {
          fly_from: "invalid-from",
        }

        response = client.search(params)

        assert !response.success?
        assert_equal 422, response.status
        assert_equal "Unprocessable Entity", response.errors.message
        assert_equal "fly_from", response.errors.full_messages.first.param
        assert_match "Not recognized location", response.errors.full_messages.first.errors.to_s
      end
    end

    it "returns results" do
      VCR.use_cassette("kiwi_api/results_cnx_bkk") do
        params = {
          fly_from: "CNX",
          fly_to: "BKK",
          date_from: "10/10/2019",
          date_to: "10/10/2019",
          return_from: "14/10/2019",
          return_to: "14/10/2019",
        }

        response = client.search(params)

        assert response.success?
        assert_equal 200, response.status
        assert_nil response.errors
        assert_equal 49, response.body.data.first.price
        assert_equal "Chiang Mai", response.body.data.first.city_from
        assert_equal "Bangkok", response.body.data.first.city_to
        assert_equal 2, response.body.data.first.route.count
      end
    end
  end

  describe "#location" do
    it "invalid params for location" do
      VCR.use_cassette("kiwi_api/invalid-location") do
        params = {}

        response = client.location(params)

        assert !response.success?
        assert_equal 400, response.status
        assert_equal "Bad Request", response.errors.message
      end
    end

    it "returns results for location" do
      VCR.use_cassette("kiwi_api/location") do
        params = {
          term: "Chiang Mai"
        }

        response = client.location(params)

        assert response.success?
        assert_equal 200, response.status
        assert_equal 2, response.body.locations.count
        assert_match "Chiang Mai International", response.body.locations.first.name
        assert_match "CNX", response.body.locations.first.code
      end
    end
  end
end
