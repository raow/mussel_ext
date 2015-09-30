class WechatUser < ActiveRecord::Base

  def self.subscribe(open_id)
    wechat_user = WechatUser.new
    if WechatUser.where(open_id: open_id).exists?
      wechat_user = WechatUser.where(open_id: open_id).first
    end 
    
    wechat_user.open_id = open_id
    wechat_user.is_subscribe = true

    wechat_user.save
  end

  def self.unsubscribe(open_id)
    wechat_user = WechatUser.where(open_id: open_id).first
    if wechat_user
      wechat_user.is_subscribe = false
      wechat_user.save
    end
  end

  def self.set_location(open_id,latitude,longitude)
    wechat_user = WechatUser.where(open_id: open_id).first
    if wechat_user
      wechat_user.latitude = latitude
      wechat_user.longitude = longitude
      wechat_user.save
    end
  end
end
