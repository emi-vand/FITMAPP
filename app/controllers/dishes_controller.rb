class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @dishes = policy_scope(Dish)
    authorize @dish
  end

  def show
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.restaurant = Restaurant.find(params[:restaurant_id])
    if @dish.save
      redirect_to restaurant_path(@dish.restaurant)
    else
      render :new
    end
    authorize @dish
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to @restaurant
    else
      render :edit
    end
    authorize @dish
  end

  def destroy
    @dish.destroy
    redirect_to :index
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description, :photo, :restaurant_id)
  end

  def set_dish
    @dish = Dish.find(params[:id])
    authorize @dish
  end
end
