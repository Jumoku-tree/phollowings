class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @works = user.works
  end
end
