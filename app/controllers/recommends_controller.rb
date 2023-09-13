class RecommendsController < ApplicationController
  def show
    products = Product.where(is_ec: true).sample(4)
    render status: :ok, json: products
  end
end
