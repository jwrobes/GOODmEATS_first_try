FactoryGirl.define do
  factory :restaurant do
    name "Park Burger"
    latitude 37.80733265795731
    longitude -122.22192088390463
    foursquare_id "5101eb39e4b055abad13f702"
    location  { {
          "address"=> "4218 Park Blvd",
          "crossStreet"=> "Glenfield",
          "lat"=> 37.80733265795731,
          "lng"=> -122.22192088390463,
          "distance"=> 2463,
          "postalCode"=> "94602",
          "cc"=> "US",
          "city"=> "Oakland",
          "state"=> "CA",
          "country"=> "United States"
         } }
  end
end
