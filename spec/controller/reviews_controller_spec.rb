# frozen_string_literal: true

require "rails_helper"

RSpec.describe ReviewsController, type: :controller do
  before { allow(controller).to receive(:authenticate_admin!).and_return(true) }

  context "GET index" do
    it "GET index, assigns @reviews" do
      review = Review.create
      get :index
      expect(assigns(:review)).to eq([review])
    end

    it "should renders index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context "GET show" do
    it "should render show view" do
      review = Review.create(email: "wqerty@mail.ru", body: "this is review body body body")
      get :show, params: { id: review.id }
      expect(response).to render_template("show")
    end
  end

  context "GET new" do
    it "should assign blank room" do
      get :new
      expect(response).to render_template("new")
    end
  end

  context "POST create" do
    it "should show created room" do
      post :create, params: { review: { remail: "wqerty@mail.ru", body: "this is review body body body" } }
      expect(response).to redirect_to(action: :show, id: assigns(:review).id)
    end
  end

  context "GET edit" do
    it "should render edit view" do
      review = Review.create(email: "wqerty@mail.ru", body: "this is review body body body")
      get :edit, params: { id: review.id }
      expect(response).to render_template("edit")
    end
  end

  context "POST update" do
    it "should render update view" do
      review = Review.create(email: "wqerty@mail.ru", body: "this is review body body body")
      patch :update, params: { id: review.id, review: { email: "wqerty@mail.ru", body: "this is review body body body" } }
      expect(response).to redirect_to(action: :show, id: review.id)
    end
  end

  context "DELETE destroy" do
    it "should destroy object with id" do
      review = Review.create(email: "wqerty@mail.ru", body: "this is review body body body")
      delete :destroy, params: { id: review.id }
      expect(Room.count).to eq 0
    end
  end

  context "GET not existing page" do
    it "should render not found/404" do
      review = Review.create(email: "wqerty@mail.ru", body: "this is review body body body")
      get :show, params: { id: review.id - 1 }
      expect(response).to render_template("error_pages/404")
    end
  end
end
