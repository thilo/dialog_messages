class CreateDialogs < ActiveRecord::Migration
  def self.up
    create_table :dialogs, :force => true do |t|
      t.integer :user_id
      t.integer :message_id
      t.integer :pair_id 
      t.string  :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :dialogs
  end
end
