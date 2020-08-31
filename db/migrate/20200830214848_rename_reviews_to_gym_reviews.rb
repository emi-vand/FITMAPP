class RenameReviewsToGymReviews < ActiveRecord::Migration[6.0]
  def change
    rename_table :reviews, :gym_reviews
  end
end
