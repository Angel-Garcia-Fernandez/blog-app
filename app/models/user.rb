class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :validatable

  has_many :posts, inverse_of: :author
  has_many :comments, inverse_of: :author
  has_many :reactions, inverse_of: :author
end
