# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
    has_many :blog_tag_relations, dependent: :delete_all
    has_many :blogs, through: :blog_tag_relations
end
