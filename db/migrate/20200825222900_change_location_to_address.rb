class ChangeLocationToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :gyms, :location, :address
    rename_column :restaurants, :location, :address
  end
end
