# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_admin!, except: %i[index show]
  rescue_from ActionController::RoutingError, with: :render_404

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to @room
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to root_path
  end

  private

  def render_404
    render template: "error_pages/404", layout: false, status: :not_found
  end

  def room_params
    params.require(:room).permit(:room_name, :capacity, :price, :desc, :interior)
  end
end
