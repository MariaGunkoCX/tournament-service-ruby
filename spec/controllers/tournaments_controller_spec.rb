require 'rails_helper'

describe TournamentsController do
  let(:user) { create(:user) }
  let(:tournament) { create(:tournament) }
  let(:result) { create(:result, user: user, tournament: tournament, answers: { '1': true, '2': true, '3': true, '4': true, '5': true, '6': false, '7': true, '8': true, '9': true, '10': false }) }

  context 'input is valid' do
    it 'saves tournament results' do
    end

    it 'get tournament results' do
      get :show, params: { id: tournament.id }
      expect(response).to have_http_status(200)
    end

    it 'fetches success per question' do
      expect(StatisticsCalculator).to receive(:success_per_question).with(tournament.results).and_return('success')
      get :success, params: { id: tournament.id }
      expect(response).to have_http_status(200)
      expect(response.body).to eq('success')
    end

    it 'fetches users scores' do
      expect(StatisticsCalculator).to receive(:user_score).with(tournament.results).and_return('scores')
      get :scores, params: { id: tournament.id }
      expect(response).to have_http_status(200)
      expect(response.body).to eq('scores')
    end

    it 'fetches tournament statistics' do
      expect(StatisticsCalculator).to receive(:success_per_question).with(tournament.results).and_return('success')
      expect(StatisticsCalculator).to receive(:user_score).with(tournament.results).and_return('scores')
      get :statistics, params: { id: tournament.id }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq({ 'success' => 'success', 'scores' => 'scores' })
    end
  end

  context 'input is not valid' do
    let(:wrong_id) { '100' }

    it 'saves tournament results' do
      post :create, params: { tournament: tournament }
      expect(response).to have_http_status(500)
    end

    it 'get tournament results' do
      get :show, params: { id: wrong_id }
      expect(response).to have_http_status(404)
    end

    it 'fetches success per question' do
      get :success, params: { id: wrong_id }
      expect(response).to have_http_status(404)
    end

    it 'fetches users scores' do
      get :scores, params: { id: wrong_id }
      expect(response).to have_http_status(404)
    end

    it 'fetches tournament statistics' do
      get :statistics, params: { id: wrong_id }
      expect(response).to have_http_status(404)
    end
  end
end
