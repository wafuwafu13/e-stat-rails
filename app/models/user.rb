# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  activation_digest :string
#  email             :string
#  image             :string
#  introduction      :string
#  name              :string
#  password_digest   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    mount_uploader :image, PictureUploader
    validates :name, presence: true, length: { maximum: 50 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :introduction, length: { maximum: 200 }
    validate :picture_size

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    private
      
    def picture_size
      if image.size > 5.megabytes
        errors.add(:picture, "5MB以下の画像にしてください")
      end
    end
end


