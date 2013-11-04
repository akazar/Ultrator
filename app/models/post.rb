# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  year       :integer
#  body       :text
#  size       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :name,  presence: true, length: {maximum: 140 }
  validates :year,  numericality: { only_integer: true, greater_than: 0, less_than: 2014 }
  validates :body,  presence: true
  validates :size,  presence: true
  has_and_belongs_to_many :subcategs
  has_many :comments, as: :commentable, dependent: :destroy
end
