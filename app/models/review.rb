# frozen_string_literal: true

class Review < ApplicationRecord
  after_initialize :default_values
  validates :reviewer_name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :body, presence: true, length: { minimum: 20 }

  scope :accepted?, lambda { |status|
    where("status = ?", status)
  }

  def default_values
    self.status ||= false
  end
end
