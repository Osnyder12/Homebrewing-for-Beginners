class PunkApiShowService
  class PunkError < StandardError; end
  PunkResponse  = Struct.new :success?, :errors, :payload, keyword_init: true

  def initialize(params = {})
    @beer_id = params[:beer_id] 
    @request_url = "https://api.punkapi.com/v2/beers/"
  end

  def call
    show_beer = beer_request
    
    raise PunkError, 'API call returned empty.' if show_beer.empty?

    PunkResponse[success?: true, payload: show_beer]
  rescue PunkError => e
    PunkResponse[success?: false, errors: e.message]
  end

  def beer_request
    request_url = build_api_url(beer_id: @beer_id)

    response = Faraday.get(request_url)

    raise PunkError, 'Empty API response.' unless response.body

    JSON.parse(response.body)
  end

  def build_api_url(beer_id:)
    raise PunkError, 'No beer id provided' unless beer_id

    @request_url += beer_id.to_s
  end
end