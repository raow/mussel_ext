FactoryGirl.define do
  factory :car_owner, class: :CarOwner do
    name '张三'
    phone '13800138000'
    car_license_no '苏JKH999'
  end

  factory :other_car_owner, class: :CarOwner do
    name '王五'
    phone '1388818000'
    car_license_no '沪AB1234'
  end
end