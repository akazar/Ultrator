class CreatePostsAndSubcateg < ActiveRecord::Migration
  def change
    create_table :posts_subcategs do |t|
      t.belongs_to :post
      t.belongs_to :subcateg
    end
  end
end
