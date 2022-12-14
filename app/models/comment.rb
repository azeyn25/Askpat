class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :headline, presence: true
  validates :description, presence: true
end
