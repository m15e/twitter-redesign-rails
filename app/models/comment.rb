class Comment < ApplicationRecord
  validates :text, presence: true, length: { maximum: 200 }
  belongs_to :user
  belongs_to :source
end
