class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reservation = Reservation.new
  end

  def create
    @superpower = Superpower.find(find_superpower)
    @reservation = Reservation.new(reservation_params)
    @reservation.superpower = @superpower
    @reservation.user = current_user
    if @reservation.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end


  def destroy
  end

  private

  def find_superpower
    @superpower = Superpower.find(params[:superpower_id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end


end
