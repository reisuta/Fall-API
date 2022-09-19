require 'rails_helper'

RSpec.describe Aim, type: :model do
  describe 'validation' do
    context '作成できない' do
      it 'タイトルが空のとき、作成できない' do
        aim = build(:aim, title: '')
        expect(aim).not_to be_valid
      end

      it '理由が空のとき、作成できない' do
        aim = build(:aim, reason: '')
        expect(aim).not_to be_valid
      end

      it '得られるものが空のとき、作成できない' do
        aim = build(:aim, advantage: '')
        expect(aim).not_to be_valid
      end

      it '終了日時が開始日時よりも前のとき、作成できない' do
        aim = build(:aim, started_at: '2022-08-11 01:54:20', ended_at: '2022-06-11 01:54:20')
        expect(aim).not_to be_valid
      end
    end
  end
end
