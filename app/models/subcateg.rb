class Subcateg < ActiveRecord::Base
  belongs_to :categ
  has_and_belongs_to_many :posts
end
