# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  content    :text
#  picture    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_blogs_on_user_id                 (user_id)
#  index_blogs_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Blog < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 3000 }
  validates :title, presence: true, length: { maximum: 40 }
  validate :picture_size

private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MB以下の画像にしてください")
    end
  end
end
