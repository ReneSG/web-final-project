class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_polls, class_name: :Poll, foreign_key: "owner_id"
  has_many :user_poll
  has_many :polls, :through => :user_poll
end
