# frozen_string_literal: true

require "rails_helper"

RSpec.describe Review, type: :model do
  context "validations" do
    it { should validate_presence_of :reviewer_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :body }
  end

  context "scope with status" do
    reviews = Review.accepted? true
    it "has status be true" do
      expect reviews.first.status.to eq(true)
    end
  end
end
