class CommentsController < ApplicationController
  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    flash.notice = 'Comment Created!'

    redirect_to article_path(@comment.article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.article_id = params[:article_id]
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.article_id = params[:article_id]
    @comment.update(comment_params)

    flash.notice = 'Comment Updated!'

    redirect_to article_path(@comment.article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    @comment.destroy

    flash.notice = 'Comment Deleted!'

    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
