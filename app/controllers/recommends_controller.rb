class RecommendsController < ApplicationController
  def show
    products = Product.all.sample(3)
    render status: :ok, json: products
  end
end
