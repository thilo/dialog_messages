PLUGIN_ROOT = File.dirname(__FILE__) + '/..'
require 'rubygems'
gem 'activerecord'
gem 'actionpack'
require 'activerecord'
require 'action_controller'


class ApplicationController < ActionController::Base
  def current_user
    nil
  end
end

class User
end

Dir.glob(PLUGIN_ROOT + "/app/**/*.rb") do |file|
  require file
end


  
#setup test database  
FileUtils.rm_rf PLUGIN_ROOT + '/test.sqlite3'
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => File.join(File.dirname(__FILE__), '..', 'test.sqlite3')

#run migrations
Dir.glob(PLUGIN_ROOT + "/db/migrate/*.rb") do |migration|
  require migration
end

CreateMessages.up
CreateDialogs.up

Spec::Runner.configure do |config|
  def set_logged_in_user(user = stub('user', :id => 1))
    @controller.stub!(:current_user).and_return(user)
    user
  end
end
