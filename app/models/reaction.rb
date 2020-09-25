class Reaction < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :comment

  delegate :email, to: :author, prefix: true, allow_nil: true

  enum reaction_type: [:like, :smile, :thumbs_up]

  validates_presence_of :reaction_type
  validates_uniqueness_of :reaction_type, scope: [:user_id, :comment_id]
end
