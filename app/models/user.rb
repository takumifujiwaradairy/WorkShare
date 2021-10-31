class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :tweets, dependent: :destroy 
  # アソシエーションを記入

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i
  validates :name, presence: true 
  validates :email, presence: true ,uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,presence: true , format: { with: VALID_PASSWORD_REGEX },length: { minimum:5, maximum:20}
  # バリテーションを記入
end
