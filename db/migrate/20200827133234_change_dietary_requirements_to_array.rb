class ChangeDietaryRequirementsToArray < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :dietary_requirements, :text, array: true, default: [], using: "(string_to_array(dietary_requirements, ','))"
  end
end
