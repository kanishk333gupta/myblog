require 'modules/wordcount'
class Post < ApplicationRecord
  include Wordcount
  # validates_with Wordcount
  # include Badword
  validates :title, :body, :status, presence: true
  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 200 }
  # validates :body , is_bad: false
  belongs_to :user
  has_many :post_tag_mappings
  has_many :tags , through: :post_tag_mappings
  has_many :comments , dependent: :destroy
  STATUS = {0 => "draft" , 1 => "publish", 2 => "archive"}
  scope :published, ->  { where(status: 1) }
  # def self.published
  #   Post.where(status: 0)
  # end
  # same as above
  scope :drafts, ->  { where(status: 0) }
  scope :archives, ->  { where(status: 2) }
  before_create :assign_status
  def assign_status
    self.status = STATUS[0]
  end
  validate :total_draft_posts, on: :create
  def total_draft_posts
    # errors.add(:status, "to many draft posts") if abc
  end
  validate :badtext, on: :save
  def badtext
    errors.add(:body,"contains bad word") if is_bad(self.body)
  end

end
