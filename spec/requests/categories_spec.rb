require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let!(:category1) { create(:category) }
  let(:category_params) { { name: 'category1' } }

  describe 'GET /index' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get category_path(category1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_category_path(category1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post categories_path, params: { category: category_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの数が一つ増える' do
        expect do
          post categories_path, params: { category: category_params }
        end.to change { Category.count }.by(1)
      end

      it '一覧画面にリダイレクトされる' do
        post categories_path, params: { category: category_params }
        expect(response).to redirect_to(categories_path)
      end
    end

    context '異常系' do
      before do
        category_params[:name] = ''
      end

      it 'レコードの数が増えない' do
        expect do
          post categories_path, params: { category: category_params }
        end.to change { Category.count }.by(0)
      end

      it '新規作成画面にレンダリングされる' do
        post categories_path, params: { category: category_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      patch category_path(category1.id), params: { category: category_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの値が変更されている' do
        patch category_path(category1.id), params: { category: category_params }
        expect(category1.reload[:name]).to eq 'category1'
      end

      it '一覧画面にリダイレクトされる' do
        patch category_path(category1.id), params: { category: category_params }
        expect(response).to redirect_to(category_path(category1.id))
      end
    end

    context '異常系' do
      before do
        category_params[:name] = ''
      end

      it 'レコードの値が変更されていない' do
        patch category_path(category1.id), params: { category: category_params }
        expect(category1.reload[:name]).to eq '英語'
      end

      it '新規作成画面にレンダリングされる' do
        patch category_path(category1.id), params: { category: category_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'レコードの数が一つ減ること' do
      expect do
        delete category_path(category1.id)
      end.to change { Category.count }.by(-1)
    end

    it '一覧画面にリダイレクトされる' do
      delete category_path(category1.id)
      expect(response).to redirect_to(categories_path)
    end
  end
end
