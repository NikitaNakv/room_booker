# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new show index edit update]

  def index
    @reviews = Review.all.order(created_at: :desc)
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
    @reviews = Review.accepted? true
  end

  def accept
    @review = Review.find(params[:id] )
    @review.update(status: true)
    redirect_to "/reviews/index"
  end



  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to "review#index"
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name, :email, :body)
  end
end
