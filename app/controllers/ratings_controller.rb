class RatingsController < ApplicationController
	before_filter :load_wine

	def show 
		@rating = Rating.find(params[:id])
	end

  def create
  	@rating = @wine.ratings.build(ratings_params)
  	@rating.user_id = current_user.id

  	if @rating.save 
  		redirect_to @wine, :notice => "Your rating has been saved!"
  	else
  		render 'wines/show'
  	end
  end

  private

  def load_wine
  	@wine = Wine.find(params[:wine_id])
  end

  def ratings_params
  	params.require(:rating).permit(:wine_id, :stars)
  end
end
