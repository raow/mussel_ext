class Response::LocationMessage < Response::Message
  
  def self.create_by_msg(message)
    if message
      Response::LocationMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :msg_id => message.MsgId,
          :location_x => message.Location_X,
          :location_y => message.Location_Y,
          :scale => message.Scale,
          :label => message.Label
      )
    end
  end
end