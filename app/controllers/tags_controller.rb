class TagsController < ApplicationController
  def show
    tag = Tag.find(params[:id])
    @works = Work.where(:tag_id tag.id)
  end
end
