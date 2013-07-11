class VotesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @vote = Vote.new
  end

  def create
    if current_user.already_voted_on? params[:votable_id]
      flash[:error] = "You already voted!"
      redirect_to root_path
    else
      @vote = Vote.new(params[:vote])
      @vote.votable_id = params[:votable_id]
      @vote.value = params[:value]
      @vote.user_id = params[:user_id]
      @vote.votable_type = params[:votable_type]

      session[:return_to] ||= request.referer

      if @vote.save
        if @vote.votable_type == "Article"
          redirect_to root_path
        else
          redirect_to session[:return_to]
        end
      else
        flash[:error] = "There was an error. Your vote was not added."
        if @vote.votable_type == "Article"
          redirect_to root_path
        else
          redirect_to session[:return_to]
        end
      end
    end
  end
end