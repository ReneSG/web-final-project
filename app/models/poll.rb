class Poll < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :options, dependent: :destroy
  has_and_belongs_to_many :users
  enum status: [:pending, :done]

  after_save :maybe_update_status

  def maybe_update_status
    if answer_count == self.users.count
      self.update_column(:status, "done")
    end
  end

  def compute_winner
    debugger;
    options.order("positive_votes DESC").first
  end

  def getNextOption(id = nil)
    options = self.options
    return nil if options.first.nil?
    return options.first.id if id == nil
    options.where("id > ?", id).order("id ASC").first.id || options.first.id
  end
end
