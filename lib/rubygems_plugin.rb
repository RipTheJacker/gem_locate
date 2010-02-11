$:.unshift File.dirname(__FILE__)     # For use/testing when no gem is installed

require 'rubygems/command_manager'
require 'rubygems/command'
require 'rubygems/commands/query_command'

require "commands/locate"
require "gem_extension/source_index"
# register gem command
Gem::CommandManager.instance.register_command :locate
