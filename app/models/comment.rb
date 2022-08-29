class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :headline, presence: true
  validates :description, presence: true
  validates :tag, inclusion: { in: ['Visa', 'Accommodation', 'Education', 'Work', 'Taxes', 'Registration', 'Translation', 'Insurance'] }
end
