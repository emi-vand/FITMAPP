class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :restaurant_bookings

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
