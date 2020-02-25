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
    redirect_to dashboard_path
  else
    render :new
  end
end

def index
  @location = params["location"]
  @location = "City" if @location == "" || @location == nil
  @category = params["Category"]
  @activity = params["Type-of-event"]

  @venues = policy_scope(Venue).order(created_at: :desc).where(["location = ? and category = ? and activity = ?", @location, @category, @activity])
  # @venues = policy_scope(Venue).order(created_at: :desc).where(location: @location and category: @category and type: @type)
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
  params.require(:venue).permit(:name, :location, :activity, :category, :description, :capacity, photos: [])
end

end
