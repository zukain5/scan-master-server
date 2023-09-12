class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :error404

  def error404
    render status: :not_found, nothing: true
  end
end
