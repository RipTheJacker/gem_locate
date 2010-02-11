class Gem::Commands::LocateCommand < Gem::Commands::QueryCommand
  def initialize
    super 'locate', 'Find all gems whose name, summary, or description match STRING'
    
     %w(-r -b --source -p -u).each{|com| remove_option com } 
  end
  
  def arguments # :nodoc:
    "STRING        fragment of gem name,summary, or description to search for"
  end

  def defaults_str # :nodoc:
    "--local"
  end

  def usage # :nodoc:
    "#{program_name} [STRING]"
  end

  def execute
    string = get_one_optional_argument
    options[:name] = /#{string}/i
    exit_code = 0

    name = options[:name]
    prerelease = options[:prerelease]

    if options[:installed] then
      if name.source.empty? then
        alert_error "You must specify a gem name"
        exit_code |= 4
      elsif installed? name, options[:version] then
        say "true"
      else
        say "false"
        exit_code |= 1
      end

      raise Gem::SystemExitException, exit_code
    end

    dep = Gem::Dependency.new name, Gem::Requirement.default

    if prerelease and not both? then
      alert_warning "prereleases are always shown locally"
    end

    if ui.outs.tty? or both? then
      say
      say "*** LOCAL GEMS ***"
      say
    end

    specs = Gem.source_index.locate dep

    spec_tuples = specs.map do |spec|
      [[spec.name, spec.version, spec.original_platform, spec], :local]
    end

    output_query_results spec_tuples
    
    # TODO support remote gem search
  end
  
end
 
