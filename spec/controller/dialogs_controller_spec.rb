require File.dirname(__FILE__) + '/../spec_helper'


describe DialogsController, 'list' do
  before(:each) do
     @user = stub('user', :dialogs => stub('dialogs', :paginate_with => :dialogs))
     set_logged_in_user @user
     User.stub!(:find).and_return(:user)
     @message = stub 'message', :receiver= => nil, :receiver => :receiver
     Message.stub!(:new).and_return(@message)
   end

   it "should assign a new message" do
     do_get
     assigns(:message).should == @message
   end

   it "should find user for passed user_id" do
     User.should_receive(:find).with('2')
     do_get
   end

   it "should set the receiver of the message to the found user" do
     @message.should_receive(:receiver=).with(:user)
     do_get
   end

   it "should get the conversions of the logged in user with the found user" do
     @user.should_receive(:dialogs).and_return(stub('dialogs', :paginate_with => :dialogs))
     do_get
   end

   it "should pagiante the conversions of the logged in user with the receiver" do
     @user.dialogs.should_receive(:paginate_with).with(:receiver, hash_including(:page =>"2"))
     do_get
   end

   it "should assign the messages" do
     do_get
     assigns(:dialogs).should == :dialogs
   end

   def do_get
     get :list, :user_id => 2, :page => 2
   end
end

describe DialogsController, 'index' do
  before(:each) do
    @user = stub('user')
    set_logged_in_user @user
  end
  
  it "should assign the users conversations" do
    @user.stub!(:conversations).and_return(:conversations)
    get :index
    assigns(:conversations).should == :conversations
  end
  
  
end   