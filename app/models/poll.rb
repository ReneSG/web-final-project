class Poll < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :options, dependent: :destroy
  has_and_belongs_to_many :users
  enum status: [:pending, :done]
end
