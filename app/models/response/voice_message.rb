class Response::VoiceMessage < Response::Message
  def self.create_by_msg(message)
    if message
      Response::VoiceMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :msg_id => message.MsgId,
          :format => message.Format,
          :media_id => message.MediaId
      )
    end
  end
end