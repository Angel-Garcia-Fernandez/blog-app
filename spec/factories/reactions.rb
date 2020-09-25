FactoryBot.define do
  factory :reaction do
    reaction_type { :like }
    author factory: :user
    comment
  end
end
