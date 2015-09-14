class RemoveServiceOrderItemModel < ActiveRecord::Migration
  def up
    add_column :service_orders, :service_item_id, :integer
    drop_table :service_order_items
  end

  def down
    remove_column :service_orders, :service_item_id
    create_table :service_order_items do |t|
      t.integer :service_order_id
      t.integer :service_item_id

      t.timestamps
    end
  end
end
