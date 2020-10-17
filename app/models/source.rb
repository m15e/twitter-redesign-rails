class Source < ApplicationRecord
  validates :text, presence: true, length: { maximum: 500 }
  belongs_to :author, class_name: 'User'
  has_many :comments
end
