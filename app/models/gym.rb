class Gym < ApplicationRecord
  belongs_to :user
  has_many :gym_classes
  has_many :class_bookings, through: :gym_classes

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_favoritable
  acts_as_taggable_on :styles

  STYLE = ["Boxing", "Dance studio", "Yoga studio", "Pilates", "General"]
end
