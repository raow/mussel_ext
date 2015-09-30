class Response::EventMessage < Response::Message
  def self.create_by_msg(message)
    if message
        Response::EventMessage.create(:from_user_name =>message.FromUserName, 
          :to_user_name => message.ToUserName, 
          :create_time => Time.at(message.CreateTime).to_datetime,
          :event => message.Event,
          :event_key => message.EventKey,
          :ticket => message.Ticket
      )
    end
  end
end