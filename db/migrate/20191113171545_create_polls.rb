class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :name
      t.date :event_date
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
