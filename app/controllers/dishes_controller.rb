class DishesController < ApplicationController
  before_action :set_restaurant_dish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @restaurant_dishes = policy_scope(RestaurantDish)
    authorize @restaurant_dish
  end

  def show
  end

  def new
    @restaurant_dish = RestaurantDish.new
    authorize @restaurant_dish
  end

  def create
    @restaurant_dish = RestaurantDish.new(restaurant_dish_params)
    if @restaurant_dish.save
      redirect_to @restaurant_dish
    else
      render :new
    end
    authorize @restaurant_dish
  end

  def edit
  end

  def update
    if @restaurant_dish.update(restaurant_dish_params)
      redirect_to @restaurant_dish
    else
      render :edit
    end
    authorize @restaurant_dish
  end

  def destroy
    @restaurant_dish.destroy
    redirect_to :index
  end

  private

  def restaurant_dish_params
    params.require(:restaurant_dish).permit(:name, :time, :photo)
  end

  def set_restaurant_dish
    @restaurant_dish = RestaurantDish.find(params[:id])
    authorize @restaurant_dish
  end
end
