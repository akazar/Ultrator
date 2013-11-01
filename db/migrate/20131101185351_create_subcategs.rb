class CreateSubcategs < ActiveRecord::Migration
  def change
    create_table :subcategs do |t|
      t.string :name
      t.belongs_to :categ
      t.timestamps
    end
  end
end
