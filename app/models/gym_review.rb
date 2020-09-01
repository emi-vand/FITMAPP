class GymReview < ApplicationRecord
  belongs_to :gym

  validates :rating, presence: true
  
end
