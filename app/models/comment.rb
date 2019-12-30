# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  mail       :string
#  name       :string
#  password   :string
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#

class Comment < ApplicationRecord
  belongs_to :blog
  validates :content, presence: true, length: { maximum: 200 }
  validates :name, length: { maximum: 10 }
  validates :title, length: { maximum: 20 }
end
