require 'yaml'

module Asphalt::Config
  def self.get_stylesheets_directory(config)
    config_hash = YAML.load(config)
    config_hash.fetch("stylesheets_directory")
  end
end
