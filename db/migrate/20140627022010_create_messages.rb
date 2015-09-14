class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :type
      #公共属性
      t.string :from_user_name
      t.string :to_user_name
      t.datetime :create_time
      t.string :msg_id
      #文本消息
      t.string :content
      #图片消息
      t.string :pic_url

      #视频消息
      t.string :media_id
      t.string :thumb_media_id
      #地理消息
      t.string :location_x
      t.string :location_y
      t.string :scale
      t.string :label
      #链接消息
      t.string :url
      t.string :title
      t.string :description
      #事件消息
      t.string :event
      t.string :event_key
      t.string :ticket
      #语音消息
      t.string :format
      t.string :recognition
      
      t.timestamps
    end
  end
end
