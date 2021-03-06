class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  # followeds are the users being followed by a user
  has_many :followeds, through: :followed_users

  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'
  # followers are users following a user
  has_many :followers, through: :following_users

  has_many :sources, foreign_key: :author_id

  has_one_attached :photo
  has_one_attached :cover_image
  has_many :comments
end
