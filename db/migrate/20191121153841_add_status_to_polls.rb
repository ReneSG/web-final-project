class AddStatusToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :status, :string
  end
end
