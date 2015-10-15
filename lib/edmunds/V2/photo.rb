module Edmunds
  class V2 < API
    class Photo < V2
      def get_photos_by_make_model_year(make, model, year, options={})
        @url = "/#{make}/#{model}/#{year}/photos?"
        call_v2_media_api(options)
      end
    end
  end
end
