class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :tweets, dependent: :destroy _
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i
  validates :name, presence: true ,uniqueness: true
  validates :email, presence: true ,uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,presence: true , format: { with: VALID_PASSWORD_REGEX }
end
