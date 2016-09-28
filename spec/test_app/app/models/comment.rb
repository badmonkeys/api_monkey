class Comment < ApplicationRecord
  include ApiMonkey::Resource

  belongs_to :user
  belongs_to :post

  validates_presence_of :message
end
