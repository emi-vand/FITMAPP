class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def index
    @restaurants = policy_scope(Restaurant)
    authorize @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def new
    authorize @restaurant
  end

  def edit
    authorize @restaurant
  end
end
