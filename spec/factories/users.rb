FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s}@blog-app.com" }
    password { '123456' }
  end
end
