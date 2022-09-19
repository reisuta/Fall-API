FactoryBot.define do
  factory :subscription do
    name { 'Netflix' }
    month_cost { 1000 }
    importance { 1 }
    alternative { 'Youtube' }
  end
end
