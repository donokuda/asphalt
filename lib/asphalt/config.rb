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
end
