require 'rails_helper'

RSpec.describe MobileContract, type: :model do
  describe 'validation' do
    context '作成できない' do
      it '会社名が空のとき、作成できない' do
        mobile_contract = build(:mobile_contract, company_name: '')
        expect(mobile_contract).not_to be_valid
      end

      it '月額料金が空のとき、作成できない' do
        mobile_contract = build(:mobile_contract, month_cost: '')
        expect(mobile_contract).not_to be_valid
      end

      it '契約詳細が空のとき、作成できない' do
        mobile_contract = build(:mobile_contract, contract_detail: '')
        expect(mobile_contract).not_to be_valid
      end

      it '終了日時が開始日時よりも前のとき、作成できない' do
        mobile_contract = build(:mobile_contract, started_at: '2022-08-11 01:54:20', ended_at: '2022-06-11 01:54:20')
        expect(mobile_contract).not_to be_valid
      end
    end
  end
end
