# frozen_string_literal: true

require "rails_helper"

RSpec.describe RoomsController, type: :controller do
  context "GET index" do
    it "should renders index view" do
      get :index
      expect(response).to render_template("index")
    end

    it "should assigns @room" do
      room = Room.create(room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      get :index
      expect(assigns(:rooms)).to eq([room])
    end
  end

  context "show room" do
    it "should render show view" do
      Room.create(room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      get :show, params: { id: 1 }
      expect(response).to render_template("show")
    end
  end

  context "new room" do
    it "should assign blank room" do
      get :new
      expect(response).to render_template("new")
    end
  end

  context "POST create" do
    it "should show created room" do
      post :create, params: { room: { room_name: "very cool room", desc: "roomroomroomroomroomroomroomroomroom123",
                                      price: "20",
                                      capacity: "15" } }
      expect(response).to render_template("show")
    end
  end

  context "edit room" do
    it "should render edit view" do
      Room.create(room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      get :edit, params: { id: 1 }
      expect(response).to render_template("edit")
    end
  end

  context "POST update" do
    it "should render update view" do
      Room.create(room_name: "cool room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      post :update, params: { id: "1", room: { room_name: "very cool room", desc: "roomroomroomroomroomroomroomroomroom123",
                                               price: "20",
                                               capacity: "15" } }
      expect(response).to render_template("show")
    end
  end
end
