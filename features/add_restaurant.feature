Feature: Add Restaurant
	As an signed in user
	I want to add a new restaurant that serves good meat

	Scenario: Find restaurant to add 
		Given I am signed in
		When I to add new restaurant
		Then I should see a search bar to find restaurants
		And I should be able to search restaurant


	