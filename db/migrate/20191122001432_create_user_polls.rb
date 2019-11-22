class CreateUserPolls < ActiveRecord::Migration[5.1]
  def change
    create_table :user_polls do |t|
      t.references :user, foreign_key: true
      t.references :poll, foreign_key: true
      t.boolean :answered

      t.timestamps
    end
  end
end
