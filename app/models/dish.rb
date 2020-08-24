class Dish < ApplicationRecord
  belongs_to :restaurant

  has_one_attached :photo

end
