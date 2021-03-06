class Post < ApplicationRecord
  belongs_to :user
  ## Added below to make sure posts have an associated `user` and `type`
  validates :user_id, presence: true
  validates :type, presence: true

  # Added for Comment model 
  has_many :comments, dependent: :destroy
end
