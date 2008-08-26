class Message < ActiveRecord::Base
  unloadable
  
  attr_accessor :receiver_id
  attr_accessor :sender_id
  attr_reader :sender
  attr_reader :receiver
  
  has_many :dialogs
  
  after_create :create_dialogs
  

  validates_presence_of :sender_id, :on => :create
  validates_presence_of :receiver_id, :on => :create
  validates_presence_of :content, :message => "Please enter a message."
  
  def sender=(value)
    @sender = value
    self.sender_id = value.id if value
  end

  def receiver=(value)
    @receiver = value
    self.receiver_id = value.id if value
  end

  private
  
  def create_dialogs
    dialogs.create!(:user_id => sender_id, :pair_id => receiver_id, :kind => 'sender')
    dialogs.create!(:user_id => receiver_id, :pair_id => sender_id, :kind => 'receiver')
  end
  
  
  
  
end
