# frozen_string_literal: true

class Review < ApplicationRecord
  validates :email, format: { with: Devise.email_regexp }
end
