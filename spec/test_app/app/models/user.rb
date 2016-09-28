class User < ApplicationRecord
  include ApiMonkey::Resource

  has_many :user_comments
  has_many :comments, through: :user_comments
  has_many :posts

  validates_presence_of :email
end
