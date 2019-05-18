# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ddiff_date :string
#

class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :feedbacks, dependent: :destroy
	validates :title, presence: true,
					  length: {minimum: 5}
end
