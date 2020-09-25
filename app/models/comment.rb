class Comment < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  has_many :reactions

  delegate :email, to: :author, prefix: true, allow_nil: true

  validates_presence_of :body
end
