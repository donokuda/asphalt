require 'yaml'

module Asphalt::Config
  def self.get_stylesheets_directory(config)
    config_hash = YAML.load(config)
    config_hash.fetch("stylesheets_directory")
  end

  def self.get_main_stylesheet(config)
    config_hash = YAML.load(config)
    config_hash.fetch("main_stylesheet")
  end

  def self.load_config_file(project_directory)
    path_to_config_file = File.join(project_directory, ".asphalt.yml")
    config = YAML.load_file(path_to_config_file)

    config
  end
end
