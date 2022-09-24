FactoryBot.define do
  factory :user do
    name { 'testUser1' }
    email { 'test@example.com' }
    password { 'foobar' }
    image { 'MyString' }
  end
end
