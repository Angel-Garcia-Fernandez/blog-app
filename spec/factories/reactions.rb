FactoryBot.define do
  factory :reaction do
    type { 'like' }
    author factory: :user
    comment
  end
end
