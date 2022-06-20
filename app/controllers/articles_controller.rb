# frozen_string_literal: true

# Article controller
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    # list of articles
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    if user_signed_in? && @article.blogger_id == current_user.blogger.id
      @article
    else
      redirect_to action: 'index'
    end
  rescue StandardError
    redirect_to action: 'index'
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if user_signed_in? && @article.blogger_id == current_user.blogger.id
      @article.destroy
      redirect_to root_path, status: :see_other
    else
      redirect_to action: 'index'
    end
  rescue StandardError
    redirect_to action: 'index'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :blogger_id)
  end
end
