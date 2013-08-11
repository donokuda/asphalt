require 'thor'

module Asphalt
  class CLI < Thor
    option :sass, :type => :boolean
    desc "init /path/to/stylesheets", "bootstrap directory with a set of Sass files"
    def init(target_directory=Dir.pwd)
      format = :sass if options[:sass] == true
      Asphalt::Generator.init!(target_directory, :format => format)
    end
  end

  CLI.start(ARGV)
end
