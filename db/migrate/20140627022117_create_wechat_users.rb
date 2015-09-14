class CreateWechatUsers < ActiveRecord::Migration
  def change
    create_table :wechat_users do |t|
      t.string :open_id
      t.string :nick_name
      t.string :sex
      t.string :province
      t.string :city
      t.string :country
      t.string :head_img_url
      t.string :privilege
      t.boolean :is_subscribe
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
