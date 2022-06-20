# frozen_string_literal: true

class Blogger < ApplicationRecord
  validates :name, :user_id, presence: true

  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  # blogger full name
  def full_name
    "#{name} #{last_name}"
  end
end
