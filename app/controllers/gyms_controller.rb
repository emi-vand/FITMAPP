class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    @gyms = policy_scope(Gym)
    @gyms = Gym.geocoded
    @markers = @gyms.map do |gym|
      {
        lat: gym.latitude,
        lng: gym.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { gym: gym }),
        image_url: helpers.asset_url('logofinal_colour_marker.png')
      }
    end

    if params["search"]
      @filter = params["search"]["styles"].reject(&:empty?)
      @gyms = @filter.empty? ? @gyms : @gyms.tagged_with(@filter, any: true)
    end
  end

  def show
    @markers = [{
      lat: @gym.latitude,
      lng: @gym.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { gym: @gym }),
      image_url: helpers.asset_url('logofinal_colour_marker.png')
    }]
    @class_booking = ClassBooking.new
    @gym_review = GymReview.new
  end

  def new
    @gym = Gym.new
    authorize @gym
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.user = current_user
    if @gym.save
      redirect_to ownerdashboard_path
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
    redirect_to gym_path(@gym)
  end

  def unfavorite
    @gym = Gym.find(params[:gym_id])
    authorize @gym
    current_user.unfavorite(@gym)
    redirect_to gym_path(@gym)
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
