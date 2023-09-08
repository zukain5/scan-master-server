class ProductsController < ApplicationController
  def index
    @products = Product.all
    render status: :ok, json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      render status: :not_found, json: {}
    else
      render status: :ok, json: @product
    end
  end
end
