class RestaurantBookingsController < ApplicationController
  before_action :set_restaurant_bookings, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    @restaurant_bookings = current_user.restaurant_bookings.all
  end

  def show
  end

  def new
    @restaurant_booking = RestaurantBooking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @restaurant_booking
  end

  def create
    @restaurant_booking = RestaurantBooking.new(restaurant_booking_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = current_user
    @restaurant_booking.user = @user
    @restaurant_booking.restaurant = @restaurant
    if @restaurant_booking.save

    else
      render "restaurants/show"
    end
    authorize @restaurant_booking
  end

  def update
    if @restaurant_booking.update(restaurant_booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
    authorize @restaurant_booking
  end

  def destroy
    @restaurant_booking.destroy
    redirect_to dashboard_path
  end

  def edit
  end

  private

  def restaurant_booking_params
    params.require(:restaurant_booking).permit(:date, :time, :restaurant_id, :user_id)
  end

  def set_restaurant_bookings
    @restaurant_booking = RestaurantBooking.find(params[:id])
    authorize @restaurant_booking
  end
end
