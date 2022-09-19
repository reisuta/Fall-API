require 'rails_helper'

RSpec.describe Category, type: :model do
  it '名前が空のとき、作成できない' do
    category = build(:category, name: '')
    expect(category).not_to be_valid
  end
end
