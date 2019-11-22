class Poll < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :options, dependent: :destroy
  has_many :user_poll
  has_many :users, :through => :user_poll

  after_save :maybe_update_status

  def maybe_update_status
    if answer_count == self.users.count
      self.update_column(:status, "done")
    end
  end

  def compute_winner
    options.order("positive_votes DESC").first
  end

  def getNextOption(id = nil)
    options = self.options
    return nil if options.first.nil?
    return options.first.id if id == nil
    options.where("id > ?", id).order("id ASC").first.id || options.first.id
  end

  def self.has_next_option(op)
    !op.poll.options.where("id > ?", op.id).order("id ASC").empty?
  end
end
