class WinesController < ApplicationController
  def index
  	@wines = Wine.all

    respond_to do |format|
        format.html
        format.json { render json: @wines}
    end
  end

  def show
  	@wine = Wine.find(params[:id])

  	if current_user
  		@review = @wine.reviews.build
  		@rating = @wine.ratings.build
  	end
  end
end
