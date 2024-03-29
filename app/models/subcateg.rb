# == Schema Information
#
# Table name: subcategs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  categ_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Subcateg < ActiveRecord::Base
  validates :name,  presence: true, length: {maximum: 60 }
  belongs_to :categ
  has_and_belongs_to_many :posts
end
