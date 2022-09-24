require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /login' do
    context 'ログイン画面' do
      it 'success' do
        get login_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /login' do
    context 'ログイン' do
      it 'sessionにuser_idが格納される' do
        post login_path, params: { session: { email: 'test@example.com', password: 'foobar' } }
        expect(!!session[:user_id]).to eq true
      end
    end
  end
end
