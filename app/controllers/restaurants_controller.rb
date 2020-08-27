class RestaurantsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

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
    @restaurant_booking = RestaurantBooking.new
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to my_restaurants_path
    else
      render :new
    end
    authorize @restaurant
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to :index
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.geocoded
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
