class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :class_bookings, dependent: :destroy

  has_one_attached :photo
end
