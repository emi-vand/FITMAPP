class CreateRestaurantBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_bookings do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
