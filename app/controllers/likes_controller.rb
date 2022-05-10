class LikesController < ApplicationController
  def create
    @work_like = Like.new(user_id: current_user.id, work_id: params[:work_id])
    @work_like.save
  end

  def destroy
    @work_like = Like.find_by(user_id: current_user.id, work_id: params[:work_id])
    @work_like.destroy
  end

end
