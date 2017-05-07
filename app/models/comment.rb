class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :remark, presence: true
end
