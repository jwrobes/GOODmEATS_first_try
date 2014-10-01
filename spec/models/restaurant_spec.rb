require 'spec_helper'

describe Restaurant do 

	it "has a valid factory" do
		FactoryGirl.create(:restaurant).should be_valid
	end

	context "validations" do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:foursquare_id)}
		it {should validate_presence_of(:latitude)}
		it {should validate_presence_of(:longitude)}
		it {should validate_presence_of(:location)}
		it {should validate_uniqueness_of(:foursquare_id)}
	end

	context do
		it {should have_many(:meats)}
		it {should have_many(:restaurantmeats)}
		it {should have_many(:sources)}
		# it {should have_many(:items)}
	end

	

end
 