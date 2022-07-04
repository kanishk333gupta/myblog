class User < ApplicationRecord
  validates :name, :email, :contact ,:pw ,presence: true
  validates :email, uniqueness: true
  before_save :capitalize_name
  def capitalize_name 
    self.name = self.name.capitalize
  end
  has_many :posts, dependent: :destroy
  has_many :post_tag_mappings
  has_many :tags ,through: :post_tag_mappings
  has_many :comments , dependent: :destroy
  
end
