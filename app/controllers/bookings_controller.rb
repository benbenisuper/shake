class BookingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.status = 1
    @user = current_user
    @booking.user = @user
    if @booking.price.nil?
    @booking.price = @booking.venue.price * (@booking.end - @booking.start).to_i
    end
    if @booking.save
      redirect_to edit_booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.is_commented?
      @review = Review.find_by(booking_id: @booking.id.to_i)
    else
      @review = Review.new
    end
    # @reviews = Review.where(booking_id: @booking.id.to_i)
    @status_message = @booking.status.to_i == 1 ? 'Payment Pending' : 'Confirmed'
    @markers = [
      {
        lat: @booking.venue.latitude,
        lng: @booking.venue.longitude
      }
    ]
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @status_message = @booking.status.to_i == 1 ? 'Payment Pending' : 'Confirmed'
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = 2
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end, :venue_id)
  end


end
