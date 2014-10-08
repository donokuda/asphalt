require "spec_helper"

describe Asphalt::Config, ".get_stylesheets_directory"  do
  before(:each) do
    @config = <<-YAML
      stylesheets_directory: app/assets/stylesheets
    YAML
    @config.gsub!(/^\s{6}/, "")
  end

  it "retrieves the setting for 'get_stylesheets_directory'" do
    result = Asphalt::Config.get_stylesheets_directory(@config)
    expect(result).to eq "app/assets/stylesheets"
  end
end

describe Asphalt::Config, ".get_main_stylesheet"  do
  before(:each) do
    @config = <<-YAML
      main_stylesheet: application.scss
    YAML
    @config.gsub!(/^\s{6}/, "")
  end

  it "retrieves the filename of the main stylesheet" do
    result = Asphalt::Config.get_main_stylesheet(@config)
    expect(result).to eq "application.scss"
  end
end
