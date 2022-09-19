require 'rails_helper'

RSpec.describe 'books', type: :request do
  let!(:book1) { create(:book) }
  let(:book_params) { { title: 'book1', author: 'dazai', amount: 1000 } }

  describe 'GET /index' do
    it 'returns http success' do
      get books_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get book_path(book1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_book_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_book_path(book1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post books_path, params: { book: book_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの数が一つ増える' do
        expect do
          post books_path, params: { book: book_params }
        end.to change { Book.count }.by(1)
      end

      it '一覧画面にリダイレクトされる' do
        post books_path, params: { book: book_params }
        expect(response).to redirect_to(books_path)
      end
    end

    context '異常系' do
      before do
        book_params[:title] = ''
      end

      it 'レコードの数が増えない' do
        expect do
          post books_path, params: { book: book_params }
        end.to change { Book.count }.by(0)
      end

      it '新規作成画面にレンダリングされる' do
        post books_path, params: { book: book_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      patch book_path(book1.id), params: { book: book_params }
      expect(response).to have_http_status(302)
    end

    context '正常系' do
      it 'レコードの値が変更されている' do
        patch book_path(book1.id), params: { book: book_params }
        expect(book1.reload[:title]).to eq 'book1'
      end

      it '一覧画面にリダイレクトされる' do
        patch book_path(book1.id), params: { book: book_params }
        expect(response).to redirect_to(book_path(book1.id))
      end
    end

    context '異常系' do
      before do
        book_params[:title] = ''
      end

      it 'レコードの値が変更されていない' do
        patch book_path(book1.id), params: { book: book_params }
        expect(book1.reload[:title]).to eq 'MyString'
      end

      it '新規作成画面にレンダリングされる' do
        patch book_path(book1.id), params: { book: book_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'レコードの数が一つ減ること' do
      expect do
        delete book_path(book1.id)
      end.to change { Book.count }.by(-1)
    end

    it '一覧画面にリダイレクトされる' do
      delete book_path(book1.id)
      expect(response).to redirect_to(books_path)
    end
  end
end
