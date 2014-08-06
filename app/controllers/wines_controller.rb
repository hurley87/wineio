class WinesController < ApplicationController
  def index
  	@wines = Wine.all
  end

  def show
  	@wine = Wine.find(params[:id])

  	if current_user
  		@review = @wine.reviews.build
  		@rating = @wine.ratings.build
  	end
  end
end
