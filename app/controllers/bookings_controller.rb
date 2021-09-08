# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_admin!, only: %i[show index edit update]
  rescue_from Exception, with: :render_404

  def index
    @bookings = Booking.all.order(created_at: :desc)

    respond_to do |format|
      format.xlsx do
        response.headers[
          "Content-Disposition"
        ] = "attachment; filename='items.xlsx'"
      end
      format.html { render :index }
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @room = Room.find(params[:id])
    @booking = @room.bookings.new
  end

  def create
    params = booking_params
    @booking = Booking.create(customer_first_name: params[:customer_first_name],
                              customer_second_name: params[:customer_second_name],
                              room_id: Room.find_by(room_name: params[:room_name]).id,
                              date_in: Date.parse("#{params["date_in(1i)"]}-#{params["date_in(2i)"]}-#{params["date_in(3i)"]}"),
                              date_out: Date.parse("#{params["date_out(1i)"]}-#{params["date_out(2i)"]}-#{params["date_out(3i)"]}"))
    if @booking.save
      flash.notice = "Your room booking is being processed"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
    redirect_to "/bookings/index"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to root_path
  end

  private

  def render_404
    render template: "error_pages/404", layout: false, status: :not_found
  end

  def booking_params
    params.require(:booking).permit(:customer_first_name, :customer_second_name, :room_name, :date_in, :date_out)
  end
end
