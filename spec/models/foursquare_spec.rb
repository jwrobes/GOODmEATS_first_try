require 'spec_helper'

describe Foursquare do
	it 'must include Httparty' do
		expect(Foursquare).to include(HTTParty)
	end

	it "must have the base uri set to FourSqaure endpoint" do
		expect(Foursquare.base_uri).to eq('https://api.foursquare.com')
	end

	it "returns array of new_restaurants instances object of restaurants nearby when given name and location data" do
		foursquare = Foursquare.new({query: 'Park Burger', lat_and_long: '37.8021100, -122.2491410'})
		expect(foursquare.search.first.class).to eq(New_Restaurant)
	end	

end