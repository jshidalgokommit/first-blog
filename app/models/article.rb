# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  belongs_to :blogger

  validates :title, :blogger_id, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
