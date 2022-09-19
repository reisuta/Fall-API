require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validation' do
    context '作成できない' do
      it 'nameが空のとき、作成できない' do
        subscription = build(:subscription, name: '')
        expect(subscription).not_to be_valid
      end

      it '月額料金が空のとき、作成できない' do
        subscription = build(:subscription, month_cost: '')
        expect(subscription).not_to be_valid
      end
    end
  end
end
