FactoryBot.define do
  factory :comment do
    body { 'Comment body' }
    author factory: :user
    post
  end
end
