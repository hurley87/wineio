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
			      :'marker-color' => '#00607d',
			      :'marker-symbol' => 'circle',
			      :'marker-size' => 'medium'
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
