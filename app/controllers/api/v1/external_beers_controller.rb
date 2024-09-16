class Api::V1::ExternalBeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    response = PunkApiIndexService.new.call

    render json: { error: response.errors }, status: 401 unless response.success?

    render json: response.payload, status: 200
  end

  def show
    response = PunkApiShowService.new(beer_id: params[:id]).call

    render json: { error: response.errors }, status: 401 unless response.success?

    render json: response.payload, status: 200
  end
end