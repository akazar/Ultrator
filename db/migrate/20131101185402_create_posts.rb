class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :year
      t.text :body
      t.string :size
      t.timestamps
    end
  end
end
