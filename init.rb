__DIR__ = File.dirname __FILE__
require __DIR__ + '/lib/acts_as_dialog_peer'
ActiveRecord::Base.send(:include, ActsAsDialogPeer)