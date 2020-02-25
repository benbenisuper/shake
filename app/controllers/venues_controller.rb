class VenuesController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

def new
  @venue = Venue.new

  authorize @venue
end

def create
  @venue = Venue.new(venue_params)

  authorize @venue

  @user = current_user
  @venue.user = @user

  if @venue.save
    redirect_to venues_path
  else
    render :new
  end
end

def index
  @venues = policy_scope(Venue).order(created_at: :desc)
end

def show
  @booking = Booking.new
  @venue = Venue.find(params[:id])

  authorize @venue
end

def delete
  @venue = Venue.find(params[:id])

  authorize @venue

  @venue.destroy
  redirect_to dashboard_path
end

def edit
  @venue = Venue.find(params[:id])

  authorize @venue
end

def update
  @venue = Venue.find(params[:id])
  authorize @venues

  @venue.update(venue_params)

  if @venue.save
    redirect_to venue_path(@venue)
  else
    render :new
  end
end

private

def venue_params
  params.require(:venue).permit(:name, :location, :category, :description, :capacity, photos: [])
end

end
