class AddPlaceIdToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :place_id, :string
  end
end
