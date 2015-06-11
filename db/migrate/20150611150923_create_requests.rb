class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_line, null: false
      t.string :host, null: false
      t.string :user_agent
      t.string :accept
      t.string :accept_language
      t.string :accept_encoding
      t.string :referer
      t.string :connection
      t.string :cookie 
      
      t.timestamps null: false
    end
  end
end
