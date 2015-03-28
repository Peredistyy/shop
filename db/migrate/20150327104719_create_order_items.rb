class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :title, null: false, default: ''
      t.text :description
      t.float :price, null: false, default: 0
      t.integer :qty, null: false, default: 1
      t.belongs_to :order, index: true
      t.timestamps null: false
    end
  end
end
