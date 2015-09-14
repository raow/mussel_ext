class AddCarOwnerIdToServiceOrder < ActiveRecord::Migration
  def change
    add_column :service_orders, :car_owner_id, :integer
  end
end
