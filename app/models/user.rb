# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  image        :string
#  introduction :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    before_save :downcase_email
    mount_uploader :image, PictureUploader
    validates :name, presence: true, length: { maximum: 50 }
    validates :introduction, length: { maximum: 200 }
    validate :picture_size

    private
      
    def picture_size
      if image.size > 5.megabytes
        errors.add(:picture, "5MB以下の画像にしてください")
      end
    end
end


