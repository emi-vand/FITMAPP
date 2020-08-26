class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :restaurant_bookings

  has_one_attached :photo

end
