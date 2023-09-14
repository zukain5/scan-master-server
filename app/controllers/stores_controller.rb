class StoresController < ApplicationController
  def index
    stores = Store.all
    render status: :ok, json: stores
  end
end
