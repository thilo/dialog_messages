require File.dirname(__FILE__) + '/../spec_helper'

describe MessagesController, 'create' do
  before(:each) do
    @user = stub('user')
    set_logged_in_user @user
    @message = stub 'message', :save => true, :sender= => nil
    Message.stub!(:new).and_return(@message)
    
  end
  
  it "should assign an new message" do
    xhr :post, :create, :message => {}
    assigns(:message).should == @message
  end
    
  it "should set the sender to logged in user" do
    @message.should_receive(:sender=).with(@user)
    xhr :post, :create, :message => {}
  end
  
  it "should save the message" do
    @message.should_receive(:save)
    xhr :post, :create, :message => {}
  end  
end


