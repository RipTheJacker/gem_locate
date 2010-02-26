$:.unshift File.dirname(__FILE__)     # For use/testing when no gem is installed

require 'rubygems/command_manager'
require 'rubygems/command'
require 'rubygems/commands/query_command'

require "commands/locate"
%w( source_index).each do |lib|
  require File.join(File.dirname(__FILE__), "gem_extension", lib)
end
# register gem command
Gem::CommandManager.instance.register_command :locate
