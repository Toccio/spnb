class SuperpowersController < ApplicationController

  def show
    @superpower = Superpower.find(params[:id])
    authorize @superpower
  end

end
