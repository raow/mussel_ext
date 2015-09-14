class ChangeLatitudeAndLongtitudeFromServiceVendors < ActiveRecord::Migration
  def change
  	change_table :service_vendors do |t|
      t.change :latitude, :decimal, precision: 10, scale: 6
      t.change :longtitude, :decimal, precision: 10, scale: 6
    end
  end
end
