module Edmunds
  class V2 < API
    class VIN < V2

      class Squish < VIN
        def get_details_by_squish_vin(squish_vin, options={})
          @url = "/squishvins/#{squish_vin}?"
          call_v2_api(options)
        end
      end

      class Decode < VIN
        def get_details_by_vin(vin, options={})
          @url = "/vins/#{vin}?"
          call_v2_api(options)
        end
      end

    end
  end
end
