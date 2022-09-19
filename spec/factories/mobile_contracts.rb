FactoryBot.define do
  factory :mobile_contract do
    company_name { '楽天' }
    month_cost { 1000 }
    cancel_cost { 10000 }
    contract_detail { '従量課金' }
    started_at { '2022-06-11 01:59:05' }
    ended_at { '2022-06-11 01:59:05' }
  end
end
