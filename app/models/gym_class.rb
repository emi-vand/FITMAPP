class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :class_bookings

end
