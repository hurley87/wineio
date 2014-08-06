class WelcomeController < ApplicationController
  def home
  	@wines = Wine.all
  end

  def about
  end
end
