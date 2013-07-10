class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      flash[:notice] = @article.title + " was added."
      redirect_to root_path
    else
      flash[:error] = "An error occurred, please try again."
      redirect_to new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end
end