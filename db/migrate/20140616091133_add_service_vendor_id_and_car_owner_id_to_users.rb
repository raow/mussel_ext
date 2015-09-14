class AddServiceVendorIdAndCarOwnerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :service_vendor_id, :integer
    add_column :users, :car_owner_id, :integer
  end
end
