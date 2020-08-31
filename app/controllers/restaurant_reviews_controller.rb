class RestaurantReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_review = RestaurantReview.new(restaurant_review_params)
    @restaurant_review.restaurant = @restaurant
    if @restaurant_review.save
      redirect_to restaurant_path(@restaurant, anchor: "review")
    else
      render 'restaurants/show'
    end
    authorize @restaurant_review
  end

  private

  def restaurant_review_params
    params.require(:restaurant_review).permit(:content, :rating)
  end
end
