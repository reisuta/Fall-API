require 'rails_helper'

RSpec.describe 'MobileContracts', type: :request do
  let!(:mobile_contract1) { create(:mobile_contract) }
  let(:mobile_contract_params) { { company_name: 'mobile_contract1', month_cost: 100, contract_detail: 'test2' } }

  describe 'GET /index' do
    it 'returns http success' do
      get mobile_contracts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get mobile_contract_path(mobile_contract1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_mobile_contract_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_mobile_contract_path(mobile_contract1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post mobile_contracts_path, params: { mobile_contract: mobile_contract_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの数が一つ増える' do
        expect do
          post mobile_contracts_path, params: { mobile_contract: mobile_contract_params }
        end.to change { MobileContract.count }.by(1)
      end

      it '一覧画面にリダイレクトされる' do
        post mobile_contracts_path, params: { mobile_contract: mobile_contract_params }
        expect(response).to redirect_to(mobile_contracts_path)
      end
    end

    context '異常系' do
      before do
        mobile_contract_params[:company_name] = ''
      end

      it 'レコードの数が増えない' do
        expect do
          post mobile_contracts_path, params: { mobile_contract: mobile_contract_params }
        end.to change { MobileContract.count }.by(0)
      end

      it '新規作成画面にレンダリングされる' do
        post mobile_contracts_path, params: { mobile_contract: mobile_contract_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      patch mobile_contract_path(mobile_contract1.id), params: { mobile_contract: mobile_contract_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの値が変更されている' do
        patch mobile_contract_path(mobile_contract1.id), params: { mobile_contract: mobile_contract_params }
        expect(mobile_contract1.reload[:company_name]).to eq 'mobile_contract1'
      end

      it '一覧画面にリダイレクトされる' do
        patch mobile_contract_path(mobile_contract1.id), params: { mobile_contract: mobile_contract_params }
        expect(response).to redirect_to(mobile_contract_path(mobile_contract1.id))
      end
    end

    context '異常系' do
      before do
        mobile_contract_params[:company_name] = ''
      end

      it 'レコードの値が変更されていない' do
        patch mobile_contract_path(mobile_contract1.id), params: { mobile_contract: mobile_contract_params }
        expect(mobile_contract1.reload[:company_name]).to eq '楽天'
      end

      it '新規作成画面にレンダリングされる' do
        patch mobile_contract_path(mobile_contract1.id), params: { mobile_contract: mobile_contract_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'レコードの数が一つ減ること' do
      expect do
        delete mobile_contract_path(mobile_contract1.id)
      end.to change { MobileContract.count }.by(-1)
    end

    it '一覧画面にリダイレクトされる' do
      delete mobile_contract_path(mobile_contract1.id)
      expect(response).to redirect_to(mobile_contracts_path)
    end
  end
end
