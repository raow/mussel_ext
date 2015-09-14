class CarOwner < ActiveRecord::Base
  has_one :user

  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :car_license_no, presence: true

  paginates_per 10
end
