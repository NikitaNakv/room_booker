# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new show index edit update]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to action: "index_with_create"
    else
      render :index_with_create, status: :unprocessable_entity
    end
  end

  def index_with_create
    @review = Review.new
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(room_params)
      redirect_to @review
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name, :email, :body)
  end
end
