# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :article, dependent: :destroy
  has_one :comment, dependent: :destroy

  validates :name, presence: true

  # get user full name
  def full_name
    "#{name} #{last_name}"
  end
end
