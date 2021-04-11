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
    rescue 
      render json: "message: error occurred", status: :bad_request
    end
  end

  def show
    begin
      current_tournament = Tournament.find(params[:id])
      final_data = JSON.parse(current_tournament.to_json)
      answers = Result.joins(:user).select("users.*,results.answers").where(results: {tournament_id: params[:id]})
      final_data["results"] = JSON.parse(answers.to_json)
      render json: final_data, status: :ok 
    rescue
      render json: "message: error occurred", status: :bad_request
    end
  end

  def statistics
  end 

  def scores
  end

  def success
    results = Result.select("results.answers").where(tournament_id: params[:id])
    statistics = successPerQuestion(results)
    render json: statistics, status: :ok 
  end

  def successPerQuestion(results)
    statistics = Array.new;
    questions = Array.new;

    # initialize empty array
    for index in 0..9 do
      questions[index] = 0;
    end

    results.each do |result|
      # count all true questions
      for index in 1..10 do
        if (result.answers[index.to_s])
          questions[index-1] = questions[index-1] + 1
        end
      end
    end

    # create statistics object
    for index in 1..10 do
      singleQuestion = {
        question: index.to_s,
        percentage: (questions[index-1]/results.length()*100).to_s + "%"
      }
      statistics.append(singleQuestion)
    end

    return statistics
  
  end

end
