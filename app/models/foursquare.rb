require 'httparty'

class Foursquare
	include HTTParty
	base_uri 'https://api.foursquare.com'

  def initialize(search_params={})
    @lat_and_long = search_params[:lat_and_long]
    @query = search_params[:query]
  end

  def search
    begin
      return parsed_response_data unless response_invalid?
      raise StandardError.new(parse_error)
    rescue => e
      Rails.logger.error e
      return false
    end
  end

  def foursquare_options
    food = '4d4b7105d754a06374d81259'
    @foursquare_options ||= ({:query =>
                   {v: "20131016", ll:@lat_and_long,
                    categoryId: food, query:@query,
                    "client_id"=>ENV['FOURSQUARE_CLIENT_ID'],
                    "client_secret"=>ENV['FOURSQUARE_CLIENT_SECRET']}
                   })
  end

  def response
    @response ||= self.class.get('/v2/venues/search', foursquare_options)
  end

  def response_invalid?
    response['meta']['code'] != 200
  end

  def parse_error
    "ERROR: #{response['meta']['errorType']}; #{response['meta']['errorDetail']}"
  end

  def parsed_response_data
    restaurants_hash = response["response"]["venues"]
    restaurants_hash.map do |venue|
      New_Restaurant.new(venue["name"],venue["location"], venue["id"])
    end
  end	

end
