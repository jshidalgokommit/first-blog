# frozen_string_literal: true

# articles comments controller
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if user_signed_in? && @comment.user_id == current_user.id
      @comment.destroy
      redirect_to article_path(@article), status: 303
    else
      redirect_to article_path(@article), status: :unauthorized
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status, :user_id)
  end
end
