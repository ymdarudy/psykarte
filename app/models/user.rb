class User < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tests, through: :favorites, source: :psychology_test
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :name, presence: true, length: { maximum: 50 }
end
