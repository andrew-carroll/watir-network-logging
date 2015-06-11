class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :request, index: true, null: false, foreign_key: true 
      t.string :proxy_connection
      t.string :connection
      t.string :date, null: false
      t.string :server, null: false
      t.string :vary
      t.string :content_encoding  
      t.string :x_content_type_options
      t.string :content_type, null: false
      t.string :via
      t.string :body
    end
  end
end
