class WorksController < ApplicationController
  require 'rubygems'
  require 'RMagick'
  
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @work = Work.find(params[:id])
    @image_prev = Magick::Image.read(@work.images[0]).first
    @image_next = Magick::Image.read(@work.images[1]).first

  end

  private
  def work_params
    params.require(:work).permit(:title, :caption, :category_id, { images: [] }).merge(user_id: current_user.id)
  end
end
