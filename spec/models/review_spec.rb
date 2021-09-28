# frozen_string_literal: true

require "rails_helper"

RSpec.describe Review, type: :model do
  context "validations" do
    context "validations" do
      it "should validate presence of body" do
        Review.create(email: "wqerty@mail.ru")
        expect(Review.count).to eq 0
      end

      it "should validate presence of email" do
        Review.create(body: "this is review body")
        expect(Review.count).to eq 0
      end

    end
  end

  context "scope with status" do
    it "has status be true" do
      Review.create(email: "wqerty@mail.ru", body: "this is review body body body")
      Review.create(email: "wqerty@mail.ru", body: "this is review body body body", status: true)
      reviews = Review.accepted? true
      expect reviews.first.status.to eq(true)
    end
  end
end
