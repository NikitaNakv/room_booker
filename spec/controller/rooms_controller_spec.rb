# frozen_string_literal: true

require "rails_helper"

RSpec.describe RoomsController, type: :controller do
  before { allow(controller).to receive(:authenticate_admin!).and_return(true) }

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
      Room.create(id: 1, room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
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
      expect(response).to redirect_to(action: :show, id: assigns(:room).id)
    end
  end

  context "edit room" do
    it "should render edit view" do
      Room.create(id: 1, room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      get :edit, params: { id: 1 }
      expect(response).to render_template("edit")
    end
  end

  context "POST update" do
    it "should render update view" do
      room = Room.create(room_name: "cool room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      patch :update, params: { id: room.id, room: { room_name: "very cool room", desc: "roomroomroomroomroomroomroomroomroom123",
                                               price: "20",
                                               capacity: "15" } }
      expect(response).to redirect_to(action: :show, id: room.id)
    end
  end

  context "DELETE destroy" do
    it "should destroy object with id" do
      room = Room.create(room_name: "cool room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      delete :destroy, params: { id: room.id }
      expect(Room.count).to eq 0
    end
  end

  context "GET not existing page" do
    it "should render not found/404" do
      Room.create(id: 1, room_name: "room", desc: "roomroomroomroomroomroomroomroomroom", price: "20", capacity: "15")
      get :show, params: { id: 2 }
      expect(response).to render_template("error_pages/404")
    end
  end
end
