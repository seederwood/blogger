class TagsController < ApplicationController
  before_action :require_login, only: %i[edit destroy]
  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)

    flash.notice = "Article '#{@tag.name}' Updated!"

    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
