require 'json'

class TournamentsController < ApplicationController

  include TournamentsHelper
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    begin
      Tournament.transaction do
        new_tournament = Tournament.create!(company_name: params[:company_name], start_date: params[:start_date], end_date: params[:end_date])
        results = params[:results]
        results.each do |result|
          new_user = User.create!(first_name: result[:firstName], last_name: result[:lastName], email: result[:email])
          temp = Result.create!(user_id: new_user.id, tournament_id: new_tournament.id , answers: result[:answers])
        end
      end 
      render json: { success: "New Tournament Created" }, status: :ok 
    rescue ActiveRecord::RecordInvalid => invalid
      render json: {error: "Failed to create a new tournament, with error: #{invalid.record.errors.full_messages} - #{invalid.record.errors.details}"}, status: :internal_server_error
    end
  end

  def show
    tournament = Tournament.find_by(id: params[:id])
    if tournament_not_found(tournament)
      render json: tournament, serializer: TournamentSerializer   
    end  
  end

  def statistics
  end 

  def scores
  end

  def success
    tournament = Tournament.includes(:results).find_by(id: params[:id])
    if tournament_not_found(tournament)
      statistics = StatisticsCalculator.success_per_question(tournament.results)
      render json: statistics, status: :ok 
    end
  end

end
