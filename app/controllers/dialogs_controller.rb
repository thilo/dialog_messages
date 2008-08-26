class DialogsController < ApplicationController
  unloadable
  
  def index
    @dialogs = current_user.dialogs.recent
  end
  
  def list
    @message = Message.new
    @message.receiver = User.find(params[:user_id])
    @dialogs = current_user.dialogs.paginate_with(@message.receiver, :page => params[:page], :per_page => 5)
    response do |format|
      format.html
      format.js
    end
  end
end
