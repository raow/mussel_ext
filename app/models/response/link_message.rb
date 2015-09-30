class Response::LinkMessage < Response::Message
  def self.create_by_msg(message)
    if message
      Response::LinkMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :msg_id => message.MsgId,
          :title => message.Title,
          :description => message.Description,
          :url => message.Url
      )
    end
  end
end