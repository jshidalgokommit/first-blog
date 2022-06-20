# frozen_string_literal: true

module VisibleHelper
  # visible status [[Text,Value],[]]
  VALID_STATUSES = [%w[Public public], %w[Private private], %w[Archived archived]].freeze

  # get valid statuses for visibility
  def valid_statuses
    VALID_STATUSES
  end
end
