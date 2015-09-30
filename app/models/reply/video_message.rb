class Reply::VideoMessage < Reply::Message
  def self.create_by_msg(message)
    if message
      Reply::VideoMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :msg_id => message.MsgId,
          :media_id => message.MediaId,
          :thumb_media_id => message.ThumbMediaId
      )
    end
  end
end