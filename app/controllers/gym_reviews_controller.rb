class GymReviewsController < ApplicationController

  def create
    @gym = Gym.find(params[:gym_id])
    @gym_review = GymReview.new(gym_review_params)
    @gym_review.gym = @gym
    if @gym_review.save
      redirect_to gym_path(@gym, anchor: "review")
    else
      render 'gyms/show'
    end
    authorize @gym_review
  end

  private

  def gym_review_params
    params.require(:gym_review).permit(:content, :rating)
  end
end
