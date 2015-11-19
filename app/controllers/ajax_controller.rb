class AjaxController < ApplicationController

  def get_source_meats
    response = {}
    meat_param = params[:meat]
    meat = Meat.find(meat_param)
    @source_meats = meat.source_meats.includes(:source)
    response = @source_meats.to_a.map do |sm| 
      {id: sm.id, name: sm.name, source: sm.source.name}
    end
    respond_to do |format|
      format.json { render json: response }
    end
  end

end
