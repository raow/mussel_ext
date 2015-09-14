class CreateServiceItemsServiceVendors < ActiveRecord::Migration
  def change
    create_table :service_items_service_vendors do |t|
      t.integer :service_item_id
      t.integer :service_vendor_id

      t.timestamps
    end
  end
end
