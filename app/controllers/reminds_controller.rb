class RemindsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    reminds = Remind.where(user:)
    render status: :ok, json: reminds
  end
end
