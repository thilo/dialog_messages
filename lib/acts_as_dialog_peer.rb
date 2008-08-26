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
          with_scope :find  => {:select => 'MAX(dialogs.id) AS id, user_id, MAX(dialogs.created_at) AS created_at, pair_id, MAX(message_id) AS message_id', :group => 'pair_id', :order => 'created_at', :include => 'message'} do
            find :all
          end
        end
       end
     end
   end 
end