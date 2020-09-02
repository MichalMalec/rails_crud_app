class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    # byebug

  end

  def create
    render plain: params[:article]
    # byebug
  end
end
