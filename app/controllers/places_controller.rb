class PlacesController < ApplicationController
  def index
  end

  def show
    @place = nil
    places = BeermappingApi.places_in(session[:place])
    places.map do |place|
      if place.id == params[:id]
        @place = place
        break
      end
    end

    if @place.nil?
      redirect_to places_path, notice: "No location with id #{params[:id]}"
    end

  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:place] = params[:city]
      render :index
    end
  end
end