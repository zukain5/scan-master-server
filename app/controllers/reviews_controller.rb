class ReviewsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    product = Product.find(params[:product_id])
    review = Review.find_by(user:, product:)
    return update(review, params[:like]) if review

    review = Review.new(
      user:,
      product:,
      like: params[:like],
    )
    if review.save
      render status: :ok, json: review
    else
      render status: :internal_server_error, nothing: true
    end
  end

  private

  def update(review, like)
    if review.update(like:)
      render status: :ok, json: review
    else
      render status: :internal_server_error, nothing: true
    end
  end
end
