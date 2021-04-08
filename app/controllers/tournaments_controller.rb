class TournamentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    Tournament.create!(company_name: params[:company_name], start_date: params[:start_date], end_date: params[:end_date])
  end

  def show
    tournament = Tournament.find(params[:id])
  end

  def statistics
  end 

  def scores
  end

  def success
  end

end
