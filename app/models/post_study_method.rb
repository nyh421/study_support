class PostStudyMethod < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  #あるユーザーにいいねされているかを判別するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #投稿を検索するメソッド
  def self.search_for(word)
    PostStudyMethod.where("title LIKE ? or body LIKE ?", "%#{word}%", "%#{word}%")
  end

end
