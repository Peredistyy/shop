class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :contact_info
      t.integer :status, null: false, default: 1
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
