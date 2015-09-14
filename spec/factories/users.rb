FactoryGirl.define do
  factory :car_owner_user, class: :User do
    email 'car_owner@test.com'
    password '12345678'
    role '车主'
    association :car_owner, factory: :car_owner
  end

  factory :car_owner_user_authenticated, class: :User do
    email 'other_car_owner@test.com'
    password '12345678'
    role '车主'
    association :car_owner, factory: :other_car_owner
    authentication_token SecureRandom.hex
  end

  factory :vendor_user, class: :User do
    email 'vendor@test.com'
    password '12345678'
    role '供应商'
    association :service_vendor, factory: :service_vendor
    authentication_token SecureRandom.hex
  end
end