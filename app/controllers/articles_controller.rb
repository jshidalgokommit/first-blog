# frozen_string_literal: true

# Article controller
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :verify_owner, only: %i[edit destroy]

  def index
    # list of articles
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
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
    @article
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
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private

  # verify if the user in session is the owner of the article
  def verify_owner
    @article = Article.find(params[:id])
    redirect_to action: 'index' unless user_signed_in? && @article.user_id == current_user.id
  rescue StandardError
    redirect_to action: 'index'
  end

  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
