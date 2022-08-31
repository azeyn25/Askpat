class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :headline, presence: true
  validates :description, presence: true, length: { minimum: 30 }
  has_one_attached :photo
end
