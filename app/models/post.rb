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
  has_and_belongs_to_many :subcategs
  has_many :comments, as: :commentable
end
