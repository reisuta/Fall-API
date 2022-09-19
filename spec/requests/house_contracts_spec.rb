require 'rails_helper'

RSpec.describe 'HouseContracts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/house_contracts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/house_contracts/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/house_contracts/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/house_contracts/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
