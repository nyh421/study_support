class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_study_method

  validates :comment, presence: true

end
