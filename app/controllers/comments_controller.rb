class CommentsController < ApplicationController
  def new

  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = "Your comment was added."
      redirect_to article_path(id: @comment.article_id)
    else
      flash[:error] = "An error occurred, please try again."
      redirect_to article_path(@article)
    end
  end
end