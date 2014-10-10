require 'yaml'

class Asphalt::Configuration
  attr_accessor :stylesheets_directory, :main_stylesheet

  def load_config_file(project_directory)
    path_to_config_file = File.join(project_directory, ".asphalt.yml")
    config_contents = YAML.load_file(path_to_config_file)

    @stylesheets_directory = get_stylesheets_directory(config_contents)
    @main_stylesheet = get_main_stylesheet(config_contents)
  end

  private

  def get_stylesheets_directory(config_hash)
    config_hash.fetch("stylesheets_directory")
  end

  def get_main_stylesheet(config_hash)
    config_hash.fetch("main_stylesheet")
  end
end
