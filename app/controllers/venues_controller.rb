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


    item = Venue.arel_table

    if @location == "City"
      @venues = policy_scope(Venue).order(created_at: :desc).where(["category = ? and activity = ?", @category, @activity])
    else
      @venues = policy_scope(Venue).order(created_at: :desc).where(["category = ? and activity = ?", @category, @activity])

      @venues = @venues.where(["location like ?", "%#{@location}%"])
    end


  @venues_geocoded= @venues.geocoded #returns flats with coordinates

  @markers = @venues_geocoded.map do |venue|
    {
      lat: venue.latitude,
      lng: venue.longitude
    }
  end
end

def show
  @venue = Venue.find(params[:id])
  @booking = @venue.bookings.build

  authorize @venue


    item = Venue.arel_table

    if @location == "City"
      @venues = policy_scope(Venue).order(created_at: :desc).where(["category = ? and activity = ?", @category, @activity])
    else
      @venues = policy_scope(Venue).order(created_at: :desc).where(["category = ? and activity = ?", @category, @activity])

      @venues = @venues.where(["location like ?", "%#{@location}%"])
    end


  @venues_geocoded= @venues.geocoded #returns flats with coordinates

  @markers = @venues_geocoded.map do |venue|
    {
      lat: venue.latitude,
      lng: venue.longitude
    }
  end


# @venue_geocoded= @venue.geocoded #returns flats with coordinates

# @markers = @venue_geocoded.map do |venue|
#   {
#     lat: venue.latitude,
#     lng: venue.longitude
#   }
# end


end

def destroy
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
  authorize @venue

  @venue.update(venue_params)

  if @venue.save
    redirect_to venue_path(@venue)
  else
    render :new
  end
end

private

def venue_params
  params.require(:venue).permit(:name, :location, :category, :description, :capacity, :price, :activity, photos: [])
end

end
