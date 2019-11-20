class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :name
      t.integer :positive_votes
      t.integer :negative_votes
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
