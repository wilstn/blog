class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :post, presence: true
end
