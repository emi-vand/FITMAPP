class GymsController < ApplicationController
  def index
    @gyms = policy_scope(Gym)
    authorize @gyms
  end

  def show
    authorize @gym
  end

  def new
    authorize @gym
  end

  def edit
    authorize @gym
  end
end
