require 'object_extensions'
require 'acts_as_dialog_peer'

__DIR__ = File.dirname __FILE__
ActiveRecord::Base.send(:include, ActsAsDialogPeer)