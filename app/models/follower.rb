class Follower < ApplicationRecord
  belongs_to :followed_by, class_name: 'User', foreign_key: 'followed_by_user_id'
  belongs_to :followed_user, class_name: 'User', foreign_key: 'followed_user_id'

  validates :followed_by_user_id, :followed_user_id, presence: true


end
