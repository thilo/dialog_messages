class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text "content"
      t.integer "sender_id"
      t.integer "receiver_id"
    end
  end

  def self.down
    drop_table :messages
  end
end