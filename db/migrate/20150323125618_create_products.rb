class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false, default: ''
      t.text :description
      t.float :price, null: false, default: 0
      t.has_attached_file :image
      t.timestamps null: false
    end
  end
end
