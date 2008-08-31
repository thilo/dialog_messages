class Message < ActiveRecord::Base
  unloadable
  
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  has_many :dialogs
  
  after_create :create_dialogs
  

  validates_presence_of :sender_id, :on => :create
  validates_presence_of :receiver_id, :on => :create
  validates_presence_of :content, :message => "Please enter a message."
  

  private
  
  def create_dialogs
    dialogs.create!(:user_id => sender_id, :pair_id => receiver_id, :kind => 'sender')
    dialogs.create!(:user_id => receiver_id, :pair_id => sender_id, :kind => 'receiver')
  end
  
  
  
  
end
