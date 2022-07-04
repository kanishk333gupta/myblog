class Comment < ApplicationRecord
  validates :description, length: { maximum: 100 }
  belongs_to :post
  # belongs_to :comment
  # has_many :comments, dependent: :destroy
end
