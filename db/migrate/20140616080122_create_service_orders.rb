class CreateServiceOrders < ActiveRecord::Migration
  def change
    create_table :service_orders do |t|
      t.string :no
      t.string :status
      t.integer :service_vendor_id
      t.integer :customer_id
      t.integer :vendor_id
      t.datetime :appointed_time

      t.timestamps
    end
  end
end
