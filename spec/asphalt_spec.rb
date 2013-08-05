require 'spec_helper'

describe Asphalt::Generator do
  describe "#init!" do
    before(:all) do
      @temp_directory = Dir.mktmpdir
      puts "Temp directory: #{ @temp_directory }"
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


    after(:all) do
      FileUtils.remove_entry_secure @temp_directory
    end
  end
end
