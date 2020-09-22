class Post < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  delegate :email, to: :author, prefix: true, allow_nil: true

  validates_presence_of :title, :body

  def publish
    update_attributes(published_at: Time.current)
  end

  def published?
    published_at.present?
  end
end
