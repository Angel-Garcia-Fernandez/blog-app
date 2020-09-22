FactoryBot.define do
  factory :post do
    title { 'Best post ever' }
    body { 'Post body' }
    published_at { nil }
    author factory: :user

    trait :published do
      published_at { 1.days.ago }
    end

    trait :with_author do
      author { create(:user) }
    end
  end
end
