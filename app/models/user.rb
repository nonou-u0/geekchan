class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable, :trackable

        
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 部分一致のみ検索
  def self.looks(word)
    where("name LIKE ?", "%#{word}%")
  end
  
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[\w+\-.]+@s.chibakoudai\.jp\z/, message: "は s.chibakoudai.jp のアドレスしか使えません" }


  validates :name, uniqueness: { case_sensitive: false, message: "はすでに使われています" }, presence: true

  has_many :favorite_blogs, through: :favorites, source: :blog

end
