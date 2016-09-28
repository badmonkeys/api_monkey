class Post < ApplicationRecord
  include ApiMonkey::Resource

  has_many :comments
  belongs_to :user

  validates_presence_of :title
end
