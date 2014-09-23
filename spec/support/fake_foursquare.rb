require 'sinatra/base'

class FakeFourSquare < Sinatra::Base

	get 'v2/venues/search/v2/venues/search?v=20130816&ll=37.8021100%2C%20-122.2491410&query=parkway%20burger&intent=checkin&categoryId=4d4b7105d754a06374d81259&client_id=A0HOXGS3TDR3NVABD1Q2LGQ5WDGN4USBKPVUHDMHMCOHSZQ4&client_secret=MU3RCF4YXGVELYX5FNTPTYUIMI1DRIPU2O11CN5UQ1VY1HE2' do
		json_response 200, 'restaurants.json'
	end

	def json_response(response_code, file_name)
		content_type :json
		status response_code
		File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
	end

end