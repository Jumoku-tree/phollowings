class WorksController < ApplicationController
  before_action :set_work, only:[:edit, :update, :show]
  require 'RMagick'
  include Magick

  def index
    @works = Work.includes(:user).order("created_at DESC")
    @works.each do |work|
      images = work.images
      # if work.images.attached?
      #   images.each do |image|
      #     image.variant(gravity: :center, resize: "270x450^", crop: "270x450+0+0").processed
      #   end
      # end
    end
  end

  def new
    @work_form = WorkForm.new
  end

  def create
    @work_form = WorkForm.new(work_form_params)
    tag_list = params[:work_form][:tag_name].split(",")
    save_tag(tag_list)
    if @work_form.valid?
      @work_form.save(@tags)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    work_attributes = @work.attributes
    @work_form = WorkForm.new(work_attributes)
    @work_form.tag_name = @work.tags&.first&.tag_name
    @tools = Tool.all
  end

  def update
    @work_form = WorkForm.new(work_form_params)
    @work_form.images ||= @work.images.blobs
    if @work_form.valid?
      @work_form.update(work_form_params, @work)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to user_path(work.user_id)
  end

  private
  def work_form_params
    params
    .require(:work_form)
    .permit(:title, :caption, :category_id, :tool_id, :tag_name, { images: [] })
    .merge(user_id: current_user.id)
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def save_tag(sent_tags)
    @tags = []
    sent_tags.each do |new_tag|
      tag_name = new_tag
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      @tags << tag
    end
    @tags.each do |tag|
      tag.save
    end
  end
end
