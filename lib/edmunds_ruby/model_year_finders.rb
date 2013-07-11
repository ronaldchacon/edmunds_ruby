module EdmundsRuby::ModelYearFinders

  def get_model_years_from_model_id(model_id)
    @url = "/modelyearrepository/formodelid?modelid=#{model_id}&"
    call_api
  end

end
