class CreateClassBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :class_bookings do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :gym_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
