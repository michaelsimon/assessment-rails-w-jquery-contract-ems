class VenuesController < ApplicationController
  before_action :get_venue, only: [:show, :edit, :update, :destroy]

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @venues = Venue.all
  end

  def destroy
  end

  private
  def get_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :state, :zipcode, :phone, :email, :website)
  end

end