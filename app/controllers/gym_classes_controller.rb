class GymClassesController < ApplicationController
  before_action :set_gym_class, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @gym_classes = policy_scope(GymClass)
    authorize @gym_classes
  end

  def show
  end

  def new
    @gym_class = GymClass.new
    @gym = Gym.find(params[:gym_id])
    authorize @gym_class
  end

  def create
    @gym_class = GymClass.new(gym_class_params)
    @gym = Gym.find(params[:gym_id])
    @gym_class.gym = @gym
    if @gym_class.save
      redirect_to gym_path(@gym)
    else
      render :new
    end
    authorize @gym_class
  end

  def edit
  end

  def update
    if @gym_class.update(gym_class_params)
      redirect_to @gym_class.gym
    else
      render :edit
    end
    authorize @gym_class
  end

  def destroy
    @gym_class.destroy
    redirect_to :index
  end

  private

  def gym_class_params
    params.require(:gym_class).permit(:name, :time, :photo, :gym_id)
  end

  def set_gym_class
    @gym_class = GymClass.find(params[:id])
    authorize @gym_class
  end
end
