# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :article, dependent: :destroy
  has_one :comment, dependent: :destroy
  has_many :followers, class_name: 'Follower', foreign_key: 'followed_user_id', dependent: :destroy
  has_many :following, class_name: 'Follower', foreign_key: 'followed_by_user_id', dependent: :destroy

  validates :name, presence: true

  # get user full name
  def full_name
    "#{name} #{last_name}"
  end

  # get followed association if user is followed by another user
  def followed_by(followed_by_user_id)
    followers.where(followed_by_user_id: followed_by_user_id).first
  end

  # user is followed by another user ?
  def followed_by?(followed_by_user_id)
    followers.where(followed_by_user_id: followed_by_user_id).present?
  end
end
