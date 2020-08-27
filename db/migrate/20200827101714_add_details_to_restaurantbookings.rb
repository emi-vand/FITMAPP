class AddDetailsToRestaurantbookings < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurant_bookings, :time, :time
  end
end
