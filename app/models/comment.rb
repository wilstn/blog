class Comment < ApplicationRecord
  belongs_to :blog

  validates :remark, presence: true
end
