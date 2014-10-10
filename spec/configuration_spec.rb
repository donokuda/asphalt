require "spec_helper"

describe Asphalt::Configuration, ".load_config_file"  do
  it "sets the instance variables" do
    project_directory = Dir.mktmpdir
    path_to_config_file = File.join(project_directory, ".asphalt.yml")
    config_content = <<-YAML
      main_stylesheet: application.scss
      stylesheets_directory: app/assets/stylesheets
    YAML
    config_content.gsub!(/^\s{6}/, "")

    config_file = File.open(path_to_config_file, "w") do |file|
      file.write(config_content)
    end
    configuration = Asphalt::Configuration.new
    configuration.load_config_file(project_directory)

    expect(configuration.stylesheets_directory).to eq "app/assets/stylesheets"
    expect(configuration.main_stylesheet).to eq "application.scss"

    FileUtils.remove_entry_secure project_directory
  end
end
