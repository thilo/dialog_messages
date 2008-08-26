class Dialog < ActiveRecord::Base
  unloadable
  
  belongs_to :user
  belongs_to :message
  belongs_to :pair, :class_name => 'User'

  validates_presence_of :message_id
  validates_presence_of :user_id
  validates_inclusion_of :kind, :in => %w(sender receiver)
  
  def content
    self.message.content
  end
end