class VenuesController < ApplicationController

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
  @venue = Venue.find(params[:id])
end

private

def venue_params
  params.require(:venue).permit(:name, :location, :category, :description, :photos)
end

end
