class Gym < ApplicationRecord
  belongs_to :user
  has_many :gym_classes
  has_many :class_bookings, through: :gym_classes

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
