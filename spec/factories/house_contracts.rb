FactoryBot.define do
  factory :house_contract do
    company_name { 'MyString' }
    management_company { 'MyString' }
    rent { 1 }
    initial_cost { 'MyString' }
    area { 1 }
    place { 'MyString' }
    age { 1 }
    property_detail { 'MyText' }
    contract_detail { 'MyText' }
    started_at { '2022-06-11 02:03:07' }
    ended_at_datetime { 'MyString' }
  end
end
