class SuperpowersController < ApplicationController

  def show
    @superpower = Superpower.find(params[:id])
    authorize @superpower
  end

  def index
    @superpowers = policy_scope(Superpower)
  end
end
