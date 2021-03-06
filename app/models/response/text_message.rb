class Response::TextMessage < Response::Message
  def self.create_by_msg(message)
    if message
      Response::TextMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :content => message.Content, 
          :msg_id => message.MsgId)
    end
  end
end