require 'rails_helper'

describe TournamentsController do
  before(:all) do
    @user = build(:user)
    @result = build(:result, user: @user, answers: { '1': true, '2': true, '3': true, '4': true, '5': true, '6': false, '7': true, '8': true, '9': true, '10': false })
    @tournament = build(:tournament, results: [@result])
  end

  context 'input is valid' do
    it 'saves tournament results' do
    end

    it 'get tournament results' do
    end

    it 'fetches success per question' do
    end

    it 'fetches users scores' do
    end

    it 'fetches tournament statistics' do
    end
  end

  context 'input is not valid' do
    let(:wrong_id) { '100' }

    it 'saves tournament results' do
      post :create, params: { tournament: @tournament }
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
