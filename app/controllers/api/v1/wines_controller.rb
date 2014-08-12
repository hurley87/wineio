module Api
	module V1
		class WinesController < ApplicationController
			
			def index
		    @wines1 = Wine.all
    
		    respond_to do |format|
		        format.html
		        format.json { render json: @wines1}
		    end
		  end
		end
	end
end