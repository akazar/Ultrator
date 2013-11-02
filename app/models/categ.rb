# == Schema Information
#
# Table name: categs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Categ < ActiveRecord::Base
   has_many :subcategs
end
