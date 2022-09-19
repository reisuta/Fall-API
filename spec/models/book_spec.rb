require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validation' do
    context '作成できない' do
      it 'タイトルが空のとき、作成できない' do
        book = build(:book, title: '')
        expect(book).not_to be_valid
      end

      it '作者が空のとき、作成できない' do
        book = build(:book, author: '')
        expect(book).not_to be_valid
      end

      it '値段が空のとき、作成できない' do
        book = build(:book, amount: '')
        expect(book).not_to be_valid
      end

      it '終了日時が開始日時よりも前のとき、作成できない' do
        book = build(:book, started_at: '2022-08-11 01:54:20', ended_at: '2022-06-11 01:54:20')
        expect(book).not_to be_valid
      end
    end
  end
end
