FactoryBot.define do
  factory :user , aliases: [:another_user] do
    nickname { "test" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "testuser" }
  end

  
end
