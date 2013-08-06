require 'spec_helper'

describe Asphalt::Generator do
  describe "#init!" do
    before(:all) do
      @temp_directory = Dir.mktmpdir
      puts "Temp directory: #{ @temp_directory }"
    end

    it "creates the target directory if it doesn't exist" do
      Asphalt::Generator.init!(File.join(@temp_directory, 'new_directory'))

      Dir.should exist(File.join(@temp_directory, 'new_directory'))
    end

    it "creates the correct set of directories and files" do
      Asphalt::Generator.init!(@temp_directory)

      File.should exist(File.join(@temp_directory, 'main.scss'))

      Dir.should exist(File.join(@temp_directory,  'modules'))
      File.should exist(File.join(@temp_directory, 'modules', '_all.scss'))
      File.should exist(File.join(@temp_directory, 'modules', '_utility.scss'))
      File.should exist(File.join(@temp_directory, 'modules', '_colors.scss'))

      Dir.should exist(File.join(@temp_directory,  'partials'))
      File.should exist(File.join(@temp_directory, 'partials', '_base.sass'))
      File.should exist(File.join(@temp_directory, 'partials', '_buttons.scss'))
      File.should exist(File.join(@temp_directory, 'partials', '_figures.scss'))
      File.should exist(File.join(@temp_directory, 'partials', '_grids.scss'))
      File.should exist(File.join(@temp_directory, 'partials', '_typography.scss'))
      File.should exist(File.join(@temp_directory, 'partials', '_reset.scss'))

      Dir.should exist(File.join(@temp_directory, 'vendors'))
    end

    it "should have content in the files generated" do
      Asphalt::Generator.init!(@temp_directory)

      File.read(File.join(@temp_directory, 'main.scss')).should match(%r(// ASPHALT GENERATED: MODULES))
      File.read(File.join(@temp_directory, 'partials', '_base.sass')).should match(%r(@import "modules/all"))
      File.read(File.join(@temp_directory, 'modules', '_all.scss')).should match(%r(// ASPHALT GENERATED: Modules))

    end

    it "should append template content to existing files" do
      existing_file = File.new(File.join(@temp_directory, 'main.scss'), 'w+')
      existing_file << "// Existing Content\n"
      existing_file.close

      Asphalt::Generator.init!(@temp_directory)

      existing_file_content = File.read(File.join(@temp_directory, 'main.scss'))

      existing_file_content.should match("// Existing Content")
      existing_file_content.should match("// ASPHALT GENERATED: MODULES")
    end

    after(:all) do
      FileUtils.remove_entry_secure @temp_directory
    end
  end
end
