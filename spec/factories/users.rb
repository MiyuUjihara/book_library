FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example_#{n}@email.com" }
    password { 12345678 }
  end
end
