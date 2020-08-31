class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:address].present?
      @restaurants = policy_scope(Restaurant).search_by_location(params[:address])
    else
      @restaurants = policy_scope(Restaurant)
    end
    @restaurants = @restaurants.geocoded

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: restaurant }),
        image_url: helpers.asset_url('fork&knife3.png')
      }
    end

    if params["search"]
      @filter = params["search"]["dietary"].reject(&:empty?)
      @restaurants = @filter.empty? ? @restaurants : @restaurants.tagged_with(@filter, any: true)
    end
  end

  def show
    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: @restaurant }),
      image_url: helpers.asset_url('fork&knife3.png')
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
      redirect_to ownerdashboard_path
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

  def favorite
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @restaurant
    current_user.favorite(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :photo, :dietary_list)
  end

  def set_restaurant
    @restaurant = Restaurant.geocoded
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
