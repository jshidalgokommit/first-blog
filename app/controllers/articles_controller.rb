class ArticlesController < ApplicationController
  def index
    #list of articles
    @articles = Article.all
  end
end
