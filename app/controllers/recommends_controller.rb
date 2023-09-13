class RecommendsController < ApplicationController
  def show
    products = Product.where(is_ec: true).sample(3)
    render status: :ok, json: products
  end
end
