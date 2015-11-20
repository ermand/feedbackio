FactoryGirl.define do
  factory :user do
    # sequence(:email) { |n| "#{n}#{Faker::Internet::email}" }
    sequence(:email) { |n| "test_#{n}@hassle.com" }
    password 'somepassword'
    created_at 1.day.ago
  end
end
