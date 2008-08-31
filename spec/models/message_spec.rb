require File.dirname(__FILE__) + '/../spec_helper'



describe Message, 'create' do
  before(:each) do
    Message.connection.stub!(:insert).and_return(1)
    @message = Message.new(:sender_id => 1, :receiver_id => 2, :content => 'text')
    @message.dialogs.stub!(:create!)
  end
  
  it "should create dialog for sender" do
    @message.dialogs.should_receive(:create!).with(:user_id => 1, :pair_id => 2, :kind => 'sender')
    @message.save!
  end
  
  it "should create a dialog for the receiver" do
    @message.dialogs.should_receive(:create!).with(:user_id => 2, :pair_id => 1, :kind => 'receiver')
    @message.save!
  end
  
  
end