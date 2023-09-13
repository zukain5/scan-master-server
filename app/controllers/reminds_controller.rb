class RemindsController < ApplicationController
  def show
    reminds = Remind.where(user_id: params[:user_id])
    render status: :ok, json: reminds
  end
end
