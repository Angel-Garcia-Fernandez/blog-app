class Post < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: :user_id

  has_many :comments
  has_many :reactions, through: :comments

  delegate :email, to: :author, prefix: true, allow_nil: true

  validates_presence_of :title, :body

  scope :published, -> { where.not(published_at: nil) }
  scope :draft, -> { where(published_at: nil) }

  def publish
    assign_attributes(published_at: Time.current)
  end

  def published?
    published_at.present?
  end
end
