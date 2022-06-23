class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_study_method

end
