# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  username   :string
#  body       :text
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :aticle	
end
