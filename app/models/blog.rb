class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,length: { maximum: 100}
  validates :body, presence: true,length: { maximum: 1000 }

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(word)
    where("title LIKE ?", "%#{word}%")
  end

  has_many :favorited_users, through: :favorites, source: :user
end

