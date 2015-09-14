class ServiceMenu < ActiveRecord::Base
  belongs_to :service_vendor
  belongs_to :service_item
end
