class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def index
    @restaurants = Restaurant.geocoded
    @restaurants = policy_scope(Restaurant)
    authorize @restaurants
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: @restaurant })
      
    }]
  end

  def new
    authorize @restaurant
  end

  def edit
  end

  private 

  def set_restaurant
    @restaurant = Restaurant.geocoded
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
