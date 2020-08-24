class CreateGyms < ActiveRecord::Migration[6.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :location
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
