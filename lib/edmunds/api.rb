module Edmunds
  class API

    require 'rest_client'

    attr_reader :base, :api_key, :image_base_url, :format, :base_url, :url

    def initialize
      if set_key
        @image_base_url = "http://media.ed.edmunds-media.com"
        @format = "fmt=json&api_key=#{@api_key}"
      else
        return @errors
      end
    end

    def set_key
      if ENV["EDMUNDS_VEHICLE"].present?
        @api_key = ENV["EDMUNDS_VEHICLE"]
      else
        @api_key = Rails.configuration.edmunds_vehicle_api_key
      end
    rescue
      @errors = "You need to set your Edmunds Vehicle API key first"
      return false
    end

    def call_api
      @base_url = @base + @url + @format
      begin
        @resp = RestClient.get(@base_url)
        @json = JSON.parse(@resp)
      rescue => e
        e.response
      end
    end

  end

end
