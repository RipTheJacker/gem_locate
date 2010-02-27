require 'rubygems'
require 'rake'
require "rake/clean"

CLEAN.include('*.gemspec', 'pkg')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gem_locate"
    gem.summary = %Q{Use this instead: http://rubygems.org/gems/rubypan}
    gem.description = %Q{Use this instead: http://rubygems.org/gems/rubypan}
    gem.email = "kabari@gmail.com"
    gem.homepage = "http://github.com/kabari/gem_locate"
    gem.authors = ["Kabari Hendrick"]
    gem.files = FileList["lib/rubygems_plugin.rb",
                         "lib/commands/locate.rb",
                         "lib/gem_extension/*.rb",
                         "README.rdoc",
                         "LICENSE",
                         "VERSION"]
    gem.test_files = []
    gem.executables = []
    gem.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if gem.respond_to? :required_rubygems_version=
    gem.post_install_message = <<MESSAGE

========================================================================

           Thanks for installing Gem Locate! You can now run:

    gem locate STRING   Same as 'gem search' but search description and summary also
    
========================================================================

MESSAGE
    
    gem.add_development_dependency "yard", ">= 0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

task :default => :check_dependencies

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
