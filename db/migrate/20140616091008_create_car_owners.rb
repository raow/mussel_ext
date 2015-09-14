class CreateCarOwners < ActiveRecord::Migration
  def change
    create_table :car_owners do |t|
      t.string :name
      t.string :phone
      t.string :car_license_no

      t.timestamps
    end
  end
end
