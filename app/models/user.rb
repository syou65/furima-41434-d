class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates :nickname, presence: true  
   validates :birth_date, presence: true  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
   validates :last_name, presence: true  
   validates :first_name, presence: true  
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: '全角カタカナを使用してください' } do
   validates :katakana_full_name, presence: true  
   validates :katakana_name, presence: true  
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
 has_many :items
 has_many :purchases
end
