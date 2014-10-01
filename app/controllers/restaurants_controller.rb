class RestaurantsController < ApplicationController

	def new
		if Restaurant.find_by_foursquare_id(params["foursqaure_id"])
			binding.pry
			@restaurant = Restaurant.find_by_foursquare_id(params["foursqaure_id"])
		else
			binding.pry
			@restaurant = Restaurant.new({name: params["name"], location: params["location"], foursquare_id: params["foursquare_id"], latitude: params[:location]["lat"], longitude: params[:location]["longitude"]})
		end
	end

	def index
		# binding.pry
		# @lat_lng = cookies[:lat_lng].split("|")
	end



end