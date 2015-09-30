class System::MenusController < ActionController::Base
  $client ||= WeixinAuthorize::Client.new(Rails.application.config.weixin.app_id, Rails.application.config.weixin.secret)
  def create
    menus_json = {
     "button" =>[
      {  
         "name"=>"查找",
         "sub_button" =>[
          {
            "type"=>"click",
            "name"=>"附近的商户",
            "key"=>"V1001_NEARBY"
          },
          {
            "type"=>"click",
            "name"=>"所有商户",
            "key"=>"V1002_ALL"
          }]
      },
      {
         "type"=>"click",
         "name"=>"我的预约",
         "key"=>"V2001_MAIN_ORDER"
      },
      {
         "type"=>"click",
         "name"=>"注册",
         "key"=>"V3001_REGISTER"
       }]
    }.to_json

    if $client.is_valid?
      response = $client.create_menu(menus_json)
    end
    redirect_to root_path, notice: response[:errmsg]
  end

  def destroy
    if $client.is_valid?
      response = $client.delete_menu
    end
    redirect_to root_path, notice: response[:errmsg]
  end
end
