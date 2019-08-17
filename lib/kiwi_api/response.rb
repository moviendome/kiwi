# frozen_string_literal: true

module KiwiApi
  class Response
    def initialize(response)
      @response = response
    end

    def success?
      true unless @response.status != 200
    end

    def status
      @response.status
    end

    def body
      JSON.parse(
        JSON.parse(@response.body).deep_transform_keys { |key| key.to_s.underscore }.to_json,
        object_class: OpenStruct
      ) rescue nil
    end

    def errors
      unless @response.success?
        err = body

        OpenStruct.new(
          message: @response.reason_phrase,
          full_messages: err.nil? ? nil : err.message
        )
      end
    end
  end
end
