# frozen_string_literal: true

require "rails_helper"

RSpec.describe Room, type: :model do
  context "validations" do
    context "validations" do
      it "should validate presence of room_name" do
        Room.create(desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
        expect(Room.count).to eq 0
      end

      it "should validate presence of desc" do
        Room.create(room_name: "room", price: "20", capacity: "15")
        expect(Room.count).to eq 0
      end

      it "should validate presence of price" do
        Room.create(room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", capacity: "15")
        expect(Room.count).to eq 0
      end

      it "should validate presence of price" do
        Room.create(room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20")
        expect(Room.count).to eq 0
      end
    end
  end

  context "associations" do
    it { should have_many(:bookings) }
  end
end
