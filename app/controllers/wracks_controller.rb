class WracksController < ApplicationController

   def create
   	@wine = Wine.find(params[:wine_id])
  	@wrack = Wrack.new
  	@racked_wines = Wrack.all
  	@wrack.user_id = current_user.id
  	@wrack.wine_id = @wine.id

  	if @racked_wines.find_by(user_id: current_user.id, wine_id: @wine.id)
  		redirect_to current_user, notice: 'Already picked that one.'
  	else
	  	if @wrack.save
	  		redirect_to current_user, notice: 'Your wine is saved!'
	  	else
	  		render :new
	  	end
	  end
  end

  private 

  def rack_params
  	params.require(:wrack).permit(:user_id, :wine_id)
  end
end
