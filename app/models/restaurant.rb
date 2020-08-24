class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :restaurant_bookings

end
