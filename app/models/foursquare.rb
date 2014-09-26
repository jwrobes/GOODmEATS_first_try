require 'httparty'

class Foursquare
	include HTTParty
	base_uri 'https://api.foursquare.com'

	def initialize(search_params={})
		food = '4d4b7105d754a06374d81259'
		@lat_and_long = search_params[:lat_and_long]
		@options =  {:query => {v: "20131016", ll:@lat_and_long, categoryId: food, query:search_params[:query], "client_id"=>"A0HOXGS3TDR3NVABD1Q2LGQ5WDGN4USBKPVUHDMHMCOHSZQ4","client_secret"=> "MU3RCF4YXGVELYX5FNTPTYUIMI1DRIPU2O11CN5UQ1VY1HE2"}}
	end

	def search
		response = self.class.get('/v2/venues/search', @options)
		if response
			return parse_data(response)
		end
	end

	def parse_data(data)
		restaurants_hash = data["response"]["venues"]
		restaurants_hash.map do |venue|
			New_Restaurant.new(venue["name"],venue["location"], venue["id"])
		end
	end	

end