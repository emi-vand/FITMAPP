class RestaurantsController < ApplicationController
  def index
    @restaurants = policy_scope(Restaurant)
    authorize @restaurants
  end

  def show
    authorize @restaurant
  end

  def new
    authorize @restaurant
  end

  def edit
    authorize @restaurant
  end
end
