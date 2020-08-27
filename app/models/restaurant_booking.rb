class RestaurantBooking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates_presence_of :date
  validates_presence_of :time

end
