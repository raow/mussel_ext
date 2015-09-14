FactoryGirl.define do
  factory :service_order, class: :ServiceOrder do
    appointed_time Time.now
  end
end