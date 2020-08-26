class Gym < ApplicationRecord
  belongs_to :user
  has_many :gym_classes
  has_many :class_bookings, through: :gym_classes

  has_one_attached :photo

end
