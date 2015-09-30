require 'net/http'
require 'json'
class API::Common
  @response_content = {
    "register_msg" => "您还未注册个人信息，<a href=\"#{Rails.configuration.weixin.host}/wechat_service/car_owners/new?open_id=%s\">注册</a> \x0A",
    "update_register_msg" => "您已注册,如需更改注册信息,请<a href=\"#{Rails.configuration.weixin.host}/wechat_service/car_owners/%s/edit\">点击这里</a>进行更改",
    "oauth_url" => "<a href=\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=#{Rails.configuration.weixin.app_id}&redirect_uri=%s&response_type=code&scope=snsapi_userinfo#wechat_redirect\">跳转</a>",
    "nearby_vendor" => "查看附近的商户,请<a href=\"#{Rails.configuration.weixin.host}/wechat_service/service_vendors?status=nearby&wechat_user=%d\">点击这里</a>",
    "all_vendor" => "查看所有的商户,请<a href=\"#{Rails.configuration.weixin.host}/wechat_service/service_vendors?status=all&wechat_user=%d\">点击这里</a>",
    "main_order" => "查看我的预约,请<a href=\"#{Rails.configuration.weixin.host}/wechat_service/service_orders?wechat_user=%d\">点击这里</a>",
    "no_order" => "您还没有预约任何服务,请先预约后再查看"
  }

  private

  #点击菜单
  def self.menu_click(key,open_id)
    if key.include?("V1")
      menu_click_consulting(key,open_id)
    elsif key.include?("V2")
      main_order(open_id)
    elsif key.include?("V3")
      register_msg(open_id)
    end
  end

  def self.menu_click_consulting(key,open_id)
    case key
    when "V1001_NEARBY"
      nearby_vendor(open_id)
    when "V1002_ALL"
      all_vendor(open_id)
    end
  end

  def self.nearby_vendor(open_id)
    user = User.where(email: open_id + "@weixin.com").first

    if user
      @response_content["nearby_vendor"] % user.id
    else
      @response_content["register_msg"] % open_id
    end
  end

  def self.all_vendor(open_id)
    user = User.where(email: open_id + "@weixin.com").first

    if user
      @response_content["all_vendor"] % user.id
    else
      @response_content["register_msg"] % open_id
    end
  end

  def self.main_order(open_id)
    user = User.where(email: open_id + "@weixin.com").first

    if user
      service_order = ServiceOrder.where(customer_id: user.id)
      if service_order.length > 0
        @response_content["main_order"] % user.id
      else
        @response_content["no_order"]
      end
    else
      @response_content["register_msg"] % open_id
    end
  end

  

  def self.register_msg(open_id)
    user = User.where(email: open_id + "@weixin.com").first

    if user
      @response_content["update_register_msg"] % user.car_owner.id
    else
      @response_content["register_msg"] % open_id
    end
  end

end