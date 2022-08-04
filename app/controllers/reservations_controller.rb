class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_superpower
    @reservation = Reservation.find(params[:id])
  end
end
