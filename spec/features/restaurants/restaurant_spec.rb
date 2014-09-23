require 'spec_helper'

feature 'User signed in to website can add new restaurant' do
	context "on home page can navigate to add new restaurant page" do
		it "can navigate to add new restaurant page" do
			visit root_path
			click_on "Add Restaurant"
			expect(page).to have_text('Find Restaurant')
		end
	end
	

	context "on add new restaurant page", js: true do
		it "can enter restaurant name in search bar and get list of matching restaurants" do
				visit add_restaurants_path
				sleep(3)
				fill_in 'search', with: 'parkway burger'
				click_on "Search"
				sleep(8)
				expect(page).to have_text('park burger')
		end
		# it "can enter click add restaurant to database and get form to enter details on restaurant and add restaurant to database" do
		
		# end
	end

end