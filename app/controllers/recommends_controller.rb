class RecommendsController < ApplicationController
  def show
    user = User.find(params[:user_id])
    products = Product.where(is_ec: true).sample(4, random: Random.new(user.id))
    render status: :ok, json: products
  end
end
