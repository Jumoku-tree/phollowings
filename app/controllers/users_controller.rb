class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @works = user.works.order("created_at DESC")
  end

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:work_id)
    @like_works = Work.find(likes)
  end


end
