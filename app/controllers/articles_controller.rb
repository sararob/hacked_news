class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all.sort { |a,b| b.num_votes <=> a.num_votes }
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
    @comments = @article.comments.sort { |a,b| b.comment_votes <=> a.comment_votes }
  end

  def newest
    @articles = Article.order("created_at desc")
  end
end