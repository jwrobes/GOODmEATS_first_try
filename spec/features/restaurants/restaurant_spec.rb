require 'spec_helper'

feature 'User signed in to website can add new restaurant' do
	# context "on home page can navigate to add new restaurant page" do
	# 	it "can navigate to add new restaurant page" do
	# 		visit root_path
	# 		click_on "Add Restaurant"
	# 		expect(page).to have_text('Find Restaurant')
	# 	end
	# end
	

	context "on add new restaurant page" do

		# it "can enter restaurant name in search bar and get list of matching restaurants" do
		# 		visit add_restaurants_path
		# 		fill_in 'search', with: 'parkway burger'
		# 		create_cookie('lat_lng','37.8021100|-122.2491410')
				
		# 		click_on "Search"
			
		# 		expect(page).to have_text('park burger')
		# end

		it "can click on add restaurant and go to form to enter new good meats restaurant in database" do
			visit add_restaurants_path
			fill_in 'search', with: 'parkway burger'
			create_cookie('lat_lng','37.8021100|-122')
			click_on "Search"
			first(:link, 'Select Restaurant').click
			expect(page).to have_text('Burger King')
		end

	 it "can add a new good meat to a new restaurant" do
	 		restaurant = FactoryGirl.create(:restaurant)
	 		visit new_restaurant_path(restaurant)
	 		click_on "Add New Meat"
	 		select "Beef", from: "Meats"
	 		select "Marin Sun Farm", from: "Source"
	 		click_on "Save Meat"
	 		within('.meats') {  expect(page).to have('Marin Sun Farm') }
		end
	end


end