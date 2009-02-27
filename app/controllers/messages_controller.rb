class MessagesController < ApplicationController
  unloadable
  
  def create
    @message = Message.new params[:message]
    @message.sender  = current_user
    @message.save
    respond_to do |format|
      format.js
    end      
  end  
end
