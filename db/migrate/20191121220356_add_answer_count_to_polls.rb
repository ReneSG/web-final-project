class AddAnswerCountToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :answer_count, :integer
  end
end
