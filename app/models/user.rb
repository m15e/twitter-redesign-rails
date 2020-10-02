class User < ApplicationRecord  
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, through: :followed_users

  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :following_users
end
