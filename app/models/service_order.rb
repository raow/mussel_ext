class ServiceOrder < ActiveRecord::Base
  include ModelConcerns::Sequenable
  
  belongs_to :service_vendor
  belongs_to :car_owner
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :vendor, class_name: 'User', foreign_key: 'vendor_id'
  belongs_to :service_item

  validates :appointed_time, :customer, :vendor, :service_item, presence: true

  sequence :SO

  before_create :set_default

  paginates_per 10

  scope :uncofirmed, -> { where status: '待确认' }
  scope :confirmed, -> { where status: '已确认' }
  scope :canceled, -> { where status: '已取消' }
  scope :refused, -> { where status: '已拒绝' }
  scope :completed, -> { where status: '已完成' }
  
  def cancel
    self.status = "已取消"
    self.save(validate: false)
  end

  def confirm
    self.status = "已确认"
    self.save(validate: false)
  end

  def refuse
    self.status = "已拒绝"
    self.save(validate: false)
  end

  def complete
    self.status = "已完成"
    self.save(validate: false)
  end

  def next_actions(user)
    case user
    when self.vendor
      return { "确认" => "confirm", "拒绝" => "refuse" } if self.status == "待确认"
      return { "完成" => "complete" } if self.status == "已确认"
    when self.customer
      return { "取消" => "cancel" } if self.status == "待确认"
      return { "完成" => "complete", "取消" => "cancel" } if self.status == "已确认"
    end
  end

  private
  def set_default
    self.status = "待确认"
    self.service_vendor = self.vendor.service_vendor
    self.car_owner = self.customer.car_owner
  end
end