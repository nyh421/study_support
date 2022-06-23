class Reward < ApplicationRecord
  belongs_to :user
  has_many :exchanged_rewards

  validates :content, presence: true

end
