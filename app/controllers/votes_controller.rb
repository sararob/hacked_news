class VotesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    @vote.votable_id = params[:votable_id]
    @vote.value = params[:value]
    @vote.user_id = params[:user_id]
    @vote.votable_type = params[:votable_type]

    if @vote.save
      redirect_to root_path
    else
      flash[:error] = "There was an error. Your vote was not added."
      redirect_to root_path
    end
  end
end