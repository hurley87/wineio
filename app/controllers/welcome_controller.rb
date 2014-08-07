class WelcomeController < ApplicationController
  def home
  	@wines = Wine.all

  	@geojson = Array.new
  	@wines.each do |wine|
  		if wine.longitude != nil && wine.latitude != nil
	  		@geojson << {
			    type: 'Feature',
			    geometry: {
			      type: 'Point',
			      coordinates: [wine.longitude, wine.latitude]
			    },
			    properties: {
			      name: wine.name,
			      address: wine.location,
			      :'marker-color' => wine.wine_color,
			      :'marker-symbol' => 'bar',
			      :'marker-size' => 'medium',
			      url: './wines/' + wine.id.to_s
			    }
			  }
			end
  	end

  	respond_to do |format|
	  		format.html
	  		format.json { render json: @geojson }
	  end
  end

  def about
  end
end
