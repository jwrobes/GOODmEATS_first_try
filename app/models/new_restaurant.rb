class New_Restaurant

  attr_reader :name, :location, :foursquare_id

  def initialize(name, location, foursquare_id)
    @name = name
    @location = location
    @foursquare_id = foursquare_id
  end

end
