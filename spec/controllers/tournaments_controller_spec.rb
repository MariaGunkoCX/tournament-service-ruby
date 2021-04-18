require 'rails_helper'

describe TournamentsController do
  before(:all) do
    @tournament = build(:tournament)
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
    it 'saves tournament results' do
      post :create, params: { tournament: @tournament }
      expect(response).to have_http_status(500)
    end

    it 'get tournament results' do
      get :show, params: { id: '100' }
      expect(response).to have_http_status(404)
    end

    it 'fetches success per question' do
    end

    it 'fetches users scores' do
    end

    it 'fetches tournament statistics' do
    end
  end
end
