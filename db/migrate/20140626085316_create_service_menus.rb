class CreateServiceMenus < ActiveRecord::Migration
  def change
    create_table :service_menus do |t|
      t.integer :service_vendor_id
      t.integer :service_item_id
      t.integer :price

      t.timestamps
    end
  end
end
