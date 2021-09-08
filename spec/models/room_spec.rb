# frozen_string_literal: true

require "rails_helper"

RSpec.describe Room, type: :model do
  context "validations" do
    it { should validate_presence_of :room_name }
    it { should validate_presence_of :capacity }
    it { should validate_presence_of :price }
    it { should validate_presence_of :desc }

    it "validates presence of name" do
      expect(room).to validate_uniqueness_of(:room_name)
    end
  end

  context "associations" do
    it { should have_many(:bookings) }
  end
end
