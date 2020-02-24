class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.user = @user
    @booking.venue = @venue

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def patch
    @booking = Booking.find(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def delete
    @booking = Booking.find(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :status)
  end


end
