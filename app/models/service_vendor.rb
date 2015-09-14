class ServiceVendor < ActiveRecord::Base
  include ModelConcerns::Sequenable

  has_many :service_menus
  has_many :service_items, through: :service_menus

  validates :no, :name, presence: true, uniqueness: true
  validates :contact, :phone, :province, :city, :region, :location_details, presence: true

  sequence :SV

  paginates_per 10

  has_attached_file :photo, :styles => { :small => "150x150>" }, :default_url => "/assets/img/:style/missing.png",
                  :url  => "/assets/service_vendors/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/service_vendors/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', "image/gif", 'image/png']
end