class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :class_bookings

  has_one_attached :photo
end
