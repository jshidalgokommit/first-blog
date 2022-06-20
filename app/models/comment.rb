# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :blogger

  validates :commenter, :body, :blogger_id, presence: true
end
