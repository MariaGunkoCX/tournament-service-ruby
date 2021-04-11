class TournamentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    new_tournament = Tournament.create!(company_name: params[:company_name], start_date: params[:start_date], end_date: params[:end_date])
    results = params[:results]
    results.each do |result|
      new_user = User.create!(first_name: result[:firstName], last_name: result[:lastName], email: result[:email])
      temp = Result.create!(user_id: new_user.id, tournament_id: new_tournament.id , answers: result[:answers])
    end
  end

  def show
    Tournament.find(params[:id])
  end

  def statistics
  end 

  def scores
  end

  def success
  end

end
