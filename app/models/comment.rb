# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :user

  validates :article_id, :commenter, :body, :user_id, presence: true
end
