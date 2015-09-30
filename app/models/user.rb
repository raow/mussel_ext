class User < ActiveRecord::Base
  include ModelConcerns::Sequenable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :car_owner
  belongs_to :service_vendor
  has_many :purchase_orders, class_name: 'ServiceOrder', foreign_key: 'customer_id'
  has_many :sale_orders, class_name: 'ServiceOrder', foreign_key: 'vendor_id'

  sequence :NO

  accepts_nested_attributes_for :service_vendor

  before_create :set_default_role

  def generate_authentication_token
    begin
      self.authentication_token = SecureRandom.hex
    end while self.class.exists?(authentication_token: authentication_token)
  end

  def active_for_authentication?
    super && !approved_at.nil?
  end

  def inactive_message
    if approved_at.nil?
      :approved
    else 
      super 
    end
  end

  def approve!
    self.approved_at = Time.now
    self.save(validate: false)
  end

  private
  def set_default_role
    self.role = "车主" unless self.car_owner.nil?
    self.role = "供应商" unless self.service_vendor.nil?
    self.role = "管理员" if self.role.nil?
  end
  
  def is_bind?
    return !self.car_owner.nil?
  end
end