FactoryBot.define do
  factory :book do
    title { 'MyString' }
    author { 'MyString' }
    amount { 1 }
    is_library { false }
    bought_at { '2022-06-11 02:04:33' }
    started_at { '2022-06-11 02:04:33' }
    ended_at { '2022-06-11 02:04:33' }
  end
end
