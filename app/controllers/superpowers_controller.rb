class SuperpowersController < ApplicationController
  def index
    @superpowers = policy_scope(Superpower)
  end
end
