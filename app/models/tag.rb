class Tag < ApplicationRecord
  has_many :post_tag_mappings
  has_many :posts , through: :post_tag_mappings
end
