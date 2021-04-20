FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@codebashing.com" }
    first_name { 'Maria' }
    last_name { 'Gunko' }
  end
end
