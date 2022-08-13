class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @reservations = User.reservations
    # @superpowers = User.reservations
    authorize @user
  end
end
