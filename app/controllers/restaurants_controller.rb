class RestaurantsController < ApplicationController

	def new
		if Restaurant.find_by_foursquare_id(params["foursqaure_id"])
			@restaurant = Restaurant.find_by_foursquare_id(params["foursqaure_id"])
		else
			@restaurant = Restaurant.new({name: params["name"], location: params["location"], foursquare_id: params["foursquare_id"] })
		end
	end

	def index
		# binding.pry
		# @lat_lng = cookies[:lat_lng].split("|")
	end



end