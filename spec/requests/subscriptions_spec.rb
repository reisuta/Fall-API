require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  let!(:subscription1) { create(:subscription) }
  let(:subscription_params) { { name: 'subscription1', month_cost: 2000 } }

  describe 'GET /index' do
    it 'returns http success' do
      get subscriptions_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get subscription_path(subscription1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_subscription_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_subscription_path(subscription1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post subscriptions_path, params: { subscription: subscription_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの数が一つ増える' do
        expect do
          post subscriptions_path, params: { subscription: subscription_params }
        end.to change { Subscription.count }.by(1)
      end

      it '一覧画面にリダイレクトされる' do
        post subscriptions_path, params: { subscription: subscription_params }
        expect(response).to redirect_to(subscriptions_path)
      end
    end

    context '異常系' do
      before do
        subscription_params[:name] = ''
      end

      it 'レコードの数が増えない' do
        expect do
          post subscriptions_path, params: { subscription: subscription_params }
        end.to change { Subscription.count }.by(0)
      end

      it '新規作成画面にレンダリングされる' do
        post subscriptions_path, params: { subscription: subscription_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      patch subscription_path(subscription1.id), params: { subscription: subscription_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの値が変更されている' do
        patch subscription_path(subscription1.id), params: { subscription: subscription_params }
        expect(subscription1.reload[:name]).to eq 'subscription1'
      end

      it '一覧画面にリダイレクトされる' do
        patch subscription_path(subscription1.id), params: { subscription: subscription_params }
        expect(response).to redirect_to(subscription_path(subscription1.id))
      end
    end

    context '異常系' do
      before do
        subscription_params[:name] = ''
      end

      it 'レコードの値が変更されていない' do
        patch subscription_path(subscription1.id), params: { subscription: subscription_params }
        expect(subscription1.reload[:name]).to eq 'Netflix'
      end

      it '新規作成画面にレンダリングされる' do
        patch subscription_path(subscription1.id), params: { subscription: subscription_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'レコードの数が一つ減ること' do
      expect do
        delete subscription_path(subscription1.id)
      end.to change { Subscription.count }.by(-1)
    end

    it '一覧画面にリダイレクトされる' do
      delete subscription_path(subscription1.id)
      expect(response).to redirect_to(subscriptions_path)
    end
  end
end
