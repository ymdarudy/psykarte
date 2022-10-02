class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tests, through: :favorites, source: :psychology_test
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :name, presence: true, length: { maximum: 50 }

  scope :guest, -> do
          find_or_create_by!(name: "ゲスト", email: "guest@example.com") do |user|
            user.password = SecureRandom.urlsafe_base64
          end
        end

  scope :guest_admin, -> do
          find_or_create_by!(name: "ゲスト管理者", email: "guestadmin@example.com") do |user|
            user.password = SecureRandom.urlsafe_base64
            user.admin = true
          end
        end
end
