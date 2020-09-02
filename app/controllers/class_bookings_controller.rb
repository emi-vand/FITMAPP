class ClassBookingsController < ApplicationController
  before_action :set_class_bookings, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]

  def new
    @gym_class = GymClass.find(params[:gym_class_id])
    @class_booking = ClassBooking.new
    authorize @class_booking
  end

  def create
    @class_booking = ClassBooking.new(class_booking_params)
    @gym_class = GymClass.find(params[:gym_class_id])
    @user = current_user
    @gym = GymClass.find(params[:gym_class_id]).gym
    @class_booking.user = @user
    @class_booking.gym_class = GymClass.find(params[:gym_class_id])
    @class_booking.save
    authorize @class_booking
    sleep(5)
    redirect_to gym_path(@gym_class)
  end

  def update
    if @class_booking.update(class_booking_params)
      redirect_to user_dashboard_path
    else
      render :edit
    end
    authorize @class_booking
  end

  def destroy
    @class_booking.destroy
    redirect_to user_dashboard_path
  end

  def edit
  end

  private

  def class_booking_params
    params.require(:class_booking).permit(:gym_class_id, :user_id, :name, :date)
  end

  def set_class_bookings
    @class_booking = ClassBooking.find(params[:id])
    authorize @class_booking
  end

end
