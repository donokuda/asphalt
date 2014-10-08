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
