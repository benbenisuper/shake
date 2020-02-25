class VenuesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :index
def new
  @venue = Venue.new
end

def create
  @venue = Venue.new(venue_params)
  @user = current_user
  @venue.user = @user

  if @venue.save
    redirect_to venues_path
  else
    render :new
  end
end

def index
  @venues = Venue.all
end

def show
  @booking = Booking.new
  @venue = Venue.find(params[:id])
end

private

def venue_params
  params.require(:venue).permit(:name, :location, :category, :description, :capacity, :photo)
end

end
