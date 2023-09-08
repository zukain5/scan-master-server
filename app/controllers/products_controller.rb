class ProductsController < ApplicationController
  def index
    @products = Product.all
    render status: :ok, json: { products: @products }
  end
end
