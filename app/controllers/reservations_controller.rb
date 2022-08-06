class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = current_user.superpowers
    @reservation = policy_scope(Superpower)
  end

  def new
    @superpower = Superpower.find(params[:superpower_id])
    authorize @superpower

    @reservation = Reservation.new
  end

  def create

    @reservation = Reservation.new(reservation_params)

    @superpower = Superpower.find(params[:superpower_id])

    @reservation.superpower = @superpower
    @reservation.user = current_user


    if @reservation.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
    authorize @reservation

  end


  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_superpower
    @superpower = Superpower.find(params[:superpower_id])
    authorize @superpower
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end


end
