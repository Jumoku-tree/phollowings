class WorksController < ApplicationController
  require 'RMagick'
  include Magick

  def index
    @works = Work.all
    @works.each do |work|
      images = work.images
      images.each do |image|
        image.variant(gravity: :center, resize: "270x450^", crop: "270x450+0+0").processed
      end
    end
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
  end

  private
  def work_params
    params.require(:work).permit(:title, :caption, :category_id, { images: [] }).merge(user_id: current_user.id)
  end

  def resize_images
  end
end
