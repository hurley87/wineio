class WracksController < ApplicationController

   def create
   	@wine = Wine.find(params[:wine_id])
  	@wrack = Wrack.new
  	@wrack.user_id = current_user.id
  	@wrack.wine_id = @wine.id

  	if @wrack.save
  		redirect_to current_user, notice: 'Your wine is saved!'
  	else
  		render :new
  	end
  end

  private 

  def rack_params
  	params.require(:wrack).permit(:user_id, :wine_id)
  end
end
