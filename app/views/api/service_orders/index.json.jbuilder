json.partial! 'api/shared/message'
json.service_orders do
  json.array!(@service_orders) do |service_order|
    json.extract! service_order, :status
    json.id service_order.no
    json.appointed_time service_order.appointed_time.strftime('%Y-%m-%d %H:%M:%S')
    json.service_vendor_name service_order.service_vendor.name
    json.customer_name service_order.customer.car_owner.name
    json.customer_phone service_order.customer.car_owner.phone
    json.service_item_no service_order.service_item.no
    json.service_item_name service_order.service_item.name
  end
end