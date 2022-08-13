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
    @superpower = Superpower.find(params[:superpower_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.superpower = @superpower
    @reservation.user = current_user
    if @reservation.save
      # redirect_to reservations_path
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
    authorize @reservation
  end

  def show
    authorize @reservation
  end

  def edit
  end

  # def update
  #   @reservation = Reservation.find_by_id(params[:id])
  #   @reservation.update(state: "approved")
  #   if @reservation.state == "approved"
  #     flash[:success] = "Reservation approved"
  #     redirect_to reservations_path
  #   else
  #     flash[:error] = "Reservation not approved"
  #     redirect_to reservations_path
  #   end
  # end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
    authorize @reservation
      # - CHECK THE PATH
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
