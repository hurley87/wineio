class WineRacksController < ApplicationController

  def create
  	@wine_for_rack.new(rack_params)
  	@wine_for_rack.user = current_user
  	@wine_for_rack.wine = @wine

  	if @wine_for_rack.save
  		redirect_to current_user, notice: 'Your wine is saved!'
  	else
  		render :new
  	end
  end

  private 

  def load_wine
  	@wine = Wine.find(params[:id])
  end

  def rack_params
  	params.require(:wine_rack).permit(:user_id, :wine_id)
  end
end
