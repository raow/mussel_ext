FactoryGirl.define do
  factory :service_item_1, class: :ServiceItem do
    no '0001'
    name '洗车'
  end

  factory :service_item_2, class: :ServiceItem do
    no '0002'
    name '换胎'
  end

  factory :service_item_3, class: :ServiceItem do
    no '0003'
    name '打蜡'
  end
end