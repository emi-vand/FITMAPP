class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :restaurant_bookings, dependent: :destroy
  has_many :restaurant_reviews, dependent: :destroy

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_favoritable
  acts_as_taggable_on :dietary

  include PgSearch::Model
    pg_search_scope :search_by_location,
      against: [ :address],
      using: {
        tsearch: { prefix: true }
      }

  DIETARY = ["Vegan", "Vegetarian", "Keto", "Paleo", "Pescatarian", "Gluten-free", "Lactose-free", "Dairy-free"]

  def average_rating
    return 0 if self.restaurant_reviews.length == 0
    review_sum = 0
    review_count = self.restaurant_reviews.length
    self.restaurant_reviews.each do |review|
      review_sum += review.rating
     end
      return (review_sum / review_count)
  end

end
