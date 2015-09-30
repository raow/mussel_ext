class Reply::ImageMessage < Reply::Message
  def self.create_by_msg(message)
    if message
      Reply::ImageMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :msg_id => message.MsgId,
          :pic_url => message.PicUrl,
          :media_id => message.MediaId
      )
    end
  end
end