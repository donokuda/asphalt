require 'thor'

module Asphalt
  class CLI < Thor
    desc "init /path/to/stylesheets", "bootstrap directory with a set of Sass files"
    def init(target_directory=Dir.pwd)
      Asphalt::Generator.init!(target_directory)
    end
  end

  CLI.start(ARGV)
end
