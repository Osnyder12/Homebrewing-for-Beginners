class Api::V1::BeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def our_beers
    render json: Beer.all
  end

  def external_beers
    render json: Beer.all.where(external_recipe: true)
  end

  def show
    beer = Beer.find(params[:id])
    malts = beer.ingredients.where(ingredient_type: "malt")
    hops = beer.ingredients.where(ingredient_type: "hop")
    yeast = beer.ingredients.where(ingredient_type: "yeast")

    reviews = beer.reviews
    render json: {
      beer: BeerShowSerializer.new(beer),
      malts: malts,
      hops: hops,
      yeast: yeast,
      reviews: reviews,
      current_user: current_user,
    }
  end
end