class CreateGymClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :gym_classes do |t|
      t.string :name
      t.time :time
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
