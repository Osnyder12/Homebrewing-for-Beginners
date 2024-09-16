class PunkApiIndexService
  class PunkError < StandardError; end
  PunkResponse  = Struct.new :success?, :errors, :payload, keyword_init: true
  
  PUNK_URL = "https://api.punkapi.com/v2/beers?page=1&per_page=20"

  def call
    external_beers = beer_request(request_url: PUNK_URL)
    
    raise PunkError, 'API call returned empty.' if external_beers.empty?

    PunkResponse[success?: true, payload: external_beers]
  rescue PunkError => e
    PunkResponse[success?: false, errors: e.message]
  end

  def beer_request(request_url:)
    response = Faraday.get(request_url)

    raise PunkError, 'Empty API response.' unless response.body

    JSON.parse(response.body)
  end
end