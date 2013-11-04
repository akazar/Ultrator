# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base
  validates :name,  presence: true, length: {maximum: 140 }
  validates :body,  presence: true
  has_many :comments, as: :commentable, dependent: :destroy
end
