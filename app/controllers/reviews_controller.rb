class ReviewsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    product = Product.find(params[:product_id])
    review = Review.find(user:, product:)
    render status: :ok, json: review
  end

  def post
    user = User.find(params[:user_id])
    product = Product.find(params[:product_id])
    review = Review.find_by(user:, product:)
    return create(user, product, params[:like]) if review.nil?

    if params[:like].zero?
      destroy(review)
    else
      update(review, params[:like])
    end
  end

  private

  def create(user, product, like)
    return render status: :ok, nothing: true if like.zero?

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

  def update(review, like)
    if review.update(like:)
      render status: :ok, json: review
    else
      render status: :internal_server_error, nothing: true
    end
  end

  def destroy(review)
    if review.destroy
      render status: :no_content, nothing: true
    else
      render status: :internal_server_error, nothing: true
  end
end
