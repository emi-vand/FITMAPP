class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :restaurant_bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_favoritable
  acts_as_taggable_on :dietary

  DIETARY = ["Vegan", "Vegetarian", "Keto", "Paleo", "Pescaritan", "Gluten-free", "Lactose-free", "Dairy-free"]
end
