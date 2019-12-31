# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  activation_digest :string
#  admin             :boolean          default(FALSE)
#  email             :string
#  image             :string
#  introduction      :string
#  name              :string
#  password_digest   :string
#  remember_digest   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    before_save :downcase_email
    mount_uploader :image, PictureUploader
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
               format: { with: VALID_EMAIL_REGEX },
               uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :introduction, length: { maximum: 200 }
    validate :picture_size

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def downcase_email
        self.email = email.downcase
    end

    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end

    def feed
        Blog.where("user_id=?", id)
    end

    private
      
    def picture_size
      if image.size > 5.megabytes
        errors.add(:picture, "5MB以下の画像にしてください")
      end
    end
end


