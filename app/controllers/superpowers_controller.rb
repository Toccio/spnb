class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show, :edit, :update, :destroy]
  # GET / superpowers
  def index
    @superpowers = policy_scope(Superpower)
    @superpowerss = Superpower.where(rating: 5).sample(4)
    @markers = @superpowers.map do |superpower|
      {
        lat: superpower.latitude,
        lng: superpower.longitude,
        info_window: render_to_string(partial: "info_window", locals: { superpower: superpower })
      }
    end
    if params[:query].present?
      @superpowers = Superpower.search_by_name_and_superpower_name(params[:query])
    else
      @superpowers = Superpower.all
    end
  end

  # GET / superpower / id
  def show
    @user = User.new
    @reservation = Reservation.new
    @reviews = @superpower.reviews
    @superpowers = policy_scope(Superpower)
    @markers = @superpowers.map do |superpower|
      {
        lat: superpower.latitude,
        lng: superpower.longitude,
        info_window: render_to_string(partial: "info_window", locals: { superpower: superpower }),
        image_url: helpers.asset_url("fulmine.png")
      }
    end
  end
# HELLO

  # GET / superpower / new
  def new
    @superpower = Superpower.new
    authorize @superpower
  end

  # POST / superpower
  def create
    @superpower = Superpower.new(superpower_params)
    @superpower.user = current_user
    authorize @superpower

    if @superpower.save
      redirect_to @superpower, notice: 'Superpower was successfully created!'
    else
      render :new
    end
  end

  # GET/superpowers/1/edit
  def edit
  end

  # PATCH/PUT/superpowers/1
  def update
    if @superpower.update(superpower_params)
      redirect_to @superpower, notice: 'Superpower now more super!'
    else
      render :edit
    end
  end

  def destroy
    @superpower.destroy
    redirect_to superpowers_path
  end

  # def search
  #   @search = params[:query]
  #   @superpowers = Superpower.all
  #   if @search.present?
  #     @superpowers = @superpowers.select { |name| name.start_with?(@search.downcase) }
  #   end
  # end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
    authorize @superpower
    # with authorize @superpower we decide which user is allowed to see this form
  end

  def superpower_params
    params.require(:superpower).permit(:more_info, :name, :superpower_name, :description, :price, :address, :created_at, :updated_at, photos: [])
  end
end
