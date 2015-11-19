class AddRestaurantsController < ApplicationController

  def index
    if cookies[:lat_lng]
      @lat_lng = cookies[:lat_lng].split("|").join(", ")
    end
    if params[:search] && @lat_lng
      foursquare = Foursquare.new({lat_and_long: @lat_lng, query: params[:search]})
      @new_restaurants = foursquare.search
    elsif params[:search]
      flash[:error] = "No Location"
    end
  end

end
