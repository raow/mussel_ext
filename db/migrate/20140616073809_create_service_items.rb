class CreateServiceItems < ActiveRecord::Migration
  def change
    create_table :service_items do |t|
      t.string :no
      t.string :name

      t.timestamps
    end
  end
end
