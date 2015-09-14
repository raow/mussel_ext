class CreateServiceOrderItems < ActiveRecord::Migration
  def change
    create_table :service_order_items do |t|
      t.integer :service_order_id
      t.integer :service_item_id

      t.timestamps
    end
  end
end
