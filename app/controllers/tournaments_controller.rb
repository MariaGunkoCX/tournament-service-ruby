require 'json'

class TournamentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    begin
      new_tournament = Tournament.create!(company_name: params[:company_name], start_date: params[:start_date], end_date: params[:end_date])
      results = params[:results]
      results.each do |result|
        new_user = User.create!(first_name: result[:firstName], last_name: result[:lastName], email: result[:email])
        temp = Result.create!(user_id: new_user.id, tournament_id: new_tournament.id , answers: result[:answers])
      end
      render json: { success: "New Tournament Created" }, status: :ok 
    rescue ActiveRecord::RecordInvalid => invalid
      render json: {error: "Failed to create a new tournament, with error: #{invalid.record.errors.full_messages} - #{invalid.record.errors.details}"}, status: :internal_server_error
    end
  end

  def show
    unless Tournament.exists?(params[:id])
      render json: { error: "Tournament Not Found" }, status: :not_found
    else
      begin
        current_tournament = Tournament.find(params[:id])
        final_data = JSON.parse(current_tournament.to_json)
        answers = Result.joins(:user).select(:first_name, :last_name, :email, :answers).where(results: {tournament_id: params[:id]})
        final_data["results"] = JSON.parse(answers.to_json)
        render json: final_data, status: :ok 
      rescue
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  end

  def statistics
  end 

  def scores
  end

  def success
    unless Tournament.exists?(params[:id])
      render json: { error: "Tournament Not Found" }, status: :not_found
    else
      begin
        results = Result.select(:answers).where(tournament_id: params[:id])
        statistics = StatisticsCalculator.success_per_question(results)
        render json: statistics, status: :ok 
      rescue
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  end

end
