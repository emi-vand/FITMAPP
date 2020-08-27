class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    @gyms = Gym.geocoded
    @gyms = policy_scope(Gym)
    authorize @gyms
    @markers = @gyms.map do |gym|
      {
        lat: gym.latitude,
        lng: gym.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { gym: gym }),
        image_url: helpers.asset_url('logofinal_colour_marker.png')
      }
    end
  end

  def show
    @markers = [{
      lat: @gym.latitude,
      lng: @gym.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { gym: @gym }),
      image_url: helpers.asset_url('logofinal_colour_marker.png')
    }]
  end

  def new
    @gym = Gym.new
    authorize @gym
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.user = current_user
    if @gym.save
      redirect_to my_gyms_path
    else
      render :new
    end
    authorize @gym
  end

  def edit
  end

  def update
    if @gym.update(gym_params)
      redirect_to @gym
    else
      render :edit
    end
  end

  def destroy
    @gym.destroy
    redirect_to :index
  end

  def favorite
    @gym = Gym.find(params[:gym_id])
    authorize @gym
    current_user.favorite(@gym)
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :address, :category, :photo, :style_list)
  end

  def set_gym
    @gym = Gym.geocoded
    @gym = Gym.find(params[:id])
    authorize @gym
  end
end
