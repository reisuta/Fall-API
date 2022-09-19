require 'rails_helper'

RSpec.describe 'Competitors', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/competitors/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/competitors/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/competitors/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/competitors/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
