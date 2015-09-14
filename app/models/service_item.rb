class ServiceItem < ActiveRecord::Base
  include ModelConcerns::Sequenable
  validates :no, :name, presence: true, uniqueness: true

  sequence :SI

  paginates_per 10
end