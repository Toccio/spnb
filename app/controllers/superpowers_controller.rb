class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show, :edit, :update, :destroy]

  # GET / superpowers
  def index
    @superpowers = policy_scope(Superpower)
  end

  # GET / superpower / id
  def show
    # @superpower = Superpower.find(params[:id])
    # authorize @superpower
    # achieved with before_action
  end

  # GET / superpower / new
  def new
    @superpower = Superpower.new
    authorize @superpower
  end

  # POST / superpowerch
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
end

private

def set_superpower
  @superpower = Superpower.find(params[:id])
  authorize @superpower
  # with authorize @superpower we decide which user is allowed to see this form
end

def superpower_params
  params.require(:superpower).permit(:name, :description, :price, :address, :created_at, :updated_at)
end
