class User < ApplicationRecord  
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  # followeds are the users being followed by a user
  has_many :followeds, through: :followed_users

  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'
  # followers are users following a user
  has_many :followers, through: :following_users
end
