class PingController < ApplicationController
  def index
    render status: :ok, json: 'pong'
  end
end
