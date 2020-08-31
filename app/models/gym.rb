class Gym < ApplicationRecord

  belongs_to :user
  has_many :gym_classes
  has_many :class_bookings, through: :gym_classes
  has_many :gym_reviews

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_favoritable

  acts_as_taggable_on :styles

  STYLE = ["Boxing", "Dance studio", "Yoga studio", "Pilates", "General"]

  def average_rating
    return 0 if self.gym_reviews.length == 0
    review_sum = 0
    review_count = self.gym_reviews.length
    self.gym_reviews.each do |review|
      review_sum += review.rating
     end
      return (review_sum / review_count)
  end

end
