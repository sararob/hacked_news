class ArticlesController < ApplicationController
  def index

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      flash[:notice] = @article.name " was added."
      redirect_to root_path
    else
      flash[:error] = "An error occurred, please try again."
      redirect_to new_article_path(@article)
    end
  end

  def show

  end
end