class ClassBookingsController < ApplicationController

  def new
    @gym_class = GymClass.find(params[:gym_class_id])
    @class_booking = ClassBooking.new
    authorize @class_booking
  end
  

  def create
    @class_booking = ClassBooking.new(class_booking_params)
    @user = current_user
    @class_booking.user = @user
    @class_booking.gym_class = GymClass.find(params[:gym_class_id])
    if @class_booking.save
      redirect_to gyms_path
    else
      render "gyms/show"
    end
    authorize @class_booking
  end

  private

  def class_booking_params
    params.require(:class_booking).permit(:gym_class_id, :user_id, :name, :date)
  end
end
