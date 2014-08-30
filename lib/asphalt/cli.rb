require 'thor'

module Asphalt
  class CLI < Thor
    option :sass, :type => :boolean
    desc "init /path/to/stylesheets", "bootstrap directory with a set of Sass files"
    def init(target_directory=Dir.pwd)
      format = :sass if options[:sass] == true
      Asphalt::Generator.init!(target_directory, :format => format)
    end

    option :sass, type: :boolean
    option :partial, type: :boolean
    desc "generate directory_name sass_filename", "Generates a new sass file and adds an import statement to your main.scss"
    def generate(*directories, filename)
      import_statement = Asphalt::Utils.format_import_directive(directories, filename)
      current_directory = FileUtils.pwd
      directory_path = File.join(current_directory, directories)

      Asphalt::Generator.create_sass_file(filename, directory_path, options)
      Asphalt::Utils.update_file!("main.scss", import_statement)
    end
  end

  CLI.start(ARGV)
end
