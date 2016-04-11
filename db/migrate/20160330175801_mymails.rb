class Mymails < ActiveRecord::Migration
  def change
  	create_table :mymails do |t|
      t.string :from, null: false, limit: 500
      t.string :subject, null: false, limit: 500
      t.text :message, null: false 
      t.datetime :received_at,  :null => false
      t.string :message_id,  :null => false, limit: 500
      t.timestamps
    end
  end
end
