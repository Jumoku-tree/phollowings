class LikesController < ApplicationController
  def create
    @work_like = Like.new(user_id: current_user.id, work_id: params[:work_id])
    @work_like.save
    work = Work.find(@work_like.work.id)
    redirect_to work_path(work.id)
  end

  def destroy
    @work_like = Like.find_by(user_id: current_user.id, work_id: params[:work_id])
    @work_like.destroy
    work = Work.find(@work_like.work.id)
    redirect_to work_path(work.id)
  end

end
