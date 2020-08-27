class ClassBooking < ApplicationRecord
  belongs_to :user
  belongs_to :gym_class

  validates :date, presence: true
  
end
