class AddAttachmentPhotoToServiceVendors < ActiveRecord::Migration
  def self.up
    change_table :service_vendors do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :service_vendors, :photo
  end
end
