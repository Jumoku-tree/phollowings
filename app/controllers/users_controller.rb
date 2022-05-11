class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @works = user.works.order("created_at DESC")
  end
end
