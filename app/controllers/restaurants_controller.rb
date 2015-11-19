class RestaurantsController < ApplicationController

  def new
    if Restaurant.find_by_foursquare_id(params["foursquare_id"])
      @new_restaurant = Restaurant.find_by_foursquare_id(params["foursquare_id"])
    else
      @new_restaurant = Restaurant.new({name: params["name"], location: params["location"], foursquare_id: params["foursquare_id"], latitude: params[:location]["lat"], longitude: params[:location]["lng"]})
    end
  end


  def create
    restaurant,restaurant_errors = add_restaurant
    
    handle_restaurant_error(restaurant_errors) if restaurant_errors

    source_meat_added = restaurant.source_meats.last.name
    message = source_meat_added + " added successfully!"
    render json: { message: message, status: 200 }

  end

  def show
  end

  def index
    # @lat_lng = cookies[:lat_lng].split("|")
  end

  def get_source_meats
  end


  private

  def restaurant_params
    params[:restaurant].delete(:id)
    params.require(:restaurant).permit!
  end

  def add_restaurant
    foursquare_id = params[:restaurant][:foursquare_id]
    restaurant = Restaurant.find_or_create_by(foursquare_id: foursquare_id)
    restaurant.update(restaurant_params)
    begin
      restaurant.save!
    rescue
      return restaurant, restaurant.errors.messages.first
    end

    return restaurant
  end

  def handle_restaurant_error(error)
    render json: {error: error, status: 422}
  end

end
