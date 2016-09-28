class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  def like
    update!(likes: likes + 1)
  end
end
