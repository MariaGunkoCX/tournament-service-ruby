require 'json'

class TournamentsController < ApplicationController

  include TournamentsHelper
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    Tournament.transaction do
      new_tournament = Tournament.create!(company_name: params[:company_name], start_date: params[:start_date], end_date: params[:end_date])
      results = params[:results]
      results.each do |result|
        new_user = User.create!(first_name: result[:firstName], last_name: result[:lastName], email: result[:email])
        temp = Result.create!(user_id: new_user.id, tournament_id: new_tournament.id , answers: result[:answers])
      end
    end 
    render json: { success: "New Tournament Created" }, status: :ok 
  end

  def show
    tournament = Tournament.find_by(id: params[:id])
    if tournament_not_found(tournament)
      render json: tournament, serializer: TournamentSerializer   
    end  
  end

  def statistics
    tournament = Tournament.includes(:results).find_by(id: params[:id])
    if tournament_not_found(tournament)
      succes_statistics = StatisticsCalculator.success_per_question(tournament.results)
      scores_statistics = StatisticsCalculator.user_score(tournament.results)
      render json: { success: succes_statistics, scores: scores_statistics }, status: :ok 
    end
  end 

  def scores
    tournament = Tournament.includes(:results).find_by(id: params[:id])
    if tournament_not_found(tournament)
      statistics = StatisticsCalculator.user_score(tournament.results)
      render json: statistics, status: :ok 
    end
  end

  def success
    tournament = Tournament.includes(:results).find_by(id: params[:id])
    if tournament_not_found(tournament)
      statistics = StatisticsCalculator.success_per_question(tournament.results)
      render json: statistics, status: :ok 
    end
  end

end
