class CreateServiceVendors < ActiveRecord::Migration
  def change
    create_table :service_vendors do |t|
      t.string :no
      t.string :name
      t.string :contact
      t.string :phone
      t.string :province
      t.string :city
      t.string :region
      t.string :location_details
      t.decimal :latitude
      t.decimal :longtitude

      t.timestamps
    end
  end
end
