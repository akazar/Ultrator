class Post < ActiveRecord::Base
  has_and_belongs_to_many :subcategs
  has_many :comments, as: :commentable
end
