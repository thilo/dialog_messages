module ActsAsDialogPeer
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_dialog_peer
      
      has_many :dialogs  do
         def find_with(pair, params = {})
           find :all, ({:conditions => {:pair_id => pair.id}, :order => 'dialogs.created_at DESC', :include => :message}.merge(params))
         end
      
         def recent
           find :all, :select => 'dialog.id, user_id, MAX(dialogs.created_at) AS created_at, pair_id, MAX(message_id) AS message_id', :group => 'pair_id', :include => 'message'
         end
       end
     end
   end 
end