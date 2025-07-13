class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable,:timeoutable, :trackable

  attr_accessor :referred_by
        
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 部分一致のみ検索
  def self.looks(word)
    where("name LIKE ?", "%#{word}%")
  end
  
  validates :email,
  presence: true,
  uniqueness: true,
  format: {
    with: /\A[\w+\-.]+@(s\.chibakoudai\.jp|gmail\.com)\z/,
    message: "は s.chibakoudai.jp または gmail.com のアドレスしか使えません"
  }


  validates :name, uniqueness: { case_sensitive: false, message: "はすでに使われています" }, presence: true

  has_many :favorite_blogs, through: :favorites, source: :blog
  has_many :post_images, dependent: :destroy  
  
  before_create :generate_invitation_code

  before_validation :validate_referral_code, on: :create

  private
  def generate_invitation_code
    return if self.invitation_code.present?

    loop do
      code = SecureRandom.hex(5)
      unless User.exists?(invitation_code: code)
        self.invitation_code = code
        break
      end
    end
  end

  # （未入力・存在しない場合）
  def validate_referral_code
    if referred_by.blank?
      errors.add(:招待コード, "を入力してください")
    elsif !User.exists?(invitation_code: referred_by)
      errors.add(:招待コード, "は存在しません")
    end
  end
end
