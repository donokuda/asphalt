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

      File.read(File.join(@temp_directory, 'main.scss')).should match(%r(@import "partials/base";))
      File.read(File.join(@temp_directory, 'partials', '_base.sass')).should match(%r(@import "modules/all"))
      File.read(File.join(@temp_directory, 'modules', '_all.scss')).should match(%r(@import 'utility';))

    end

    it "should append template content to existing files" do
      existing_file = File.new(File.join(@temp_directory, 'main.scss'), 'w+')
      existing_file << "// Existing Content\n"
      existing_file.close

      Asphalt::Generator.init!(@temp_directory)

      existing_file_content = File.read(File.join(@temp_directory, 'main.scss'))

      existing_file_content.should match("// Existing Content")
      existing_file_content.should match(%r(@import "partials/base";))
    end

    context "with the sass format option" do
      it "creates sass files with the sass argument" do
        sass_directory = Dir.mktmpdir

        Asphalt::Generator.init!(sass_directory, :format => :sass)

        File.should exist(File.join(sass_directory, 'main.sass'))
        File.should exist(File.join(sass_directory, 'modules', '_all.sass'))
        File.should exist(File.join(sass_directory, 'partials', '_base.sass'))
        File.should exist(File.join(sass_directory, 'partials', '_buttons.sass'))

        FileUtils.remove_entry_secure sass_directory
      end

      it "has files with the indented sass format" do
        sass_directory = Dir.mktmpdir

        Asphalt::Generator.init!(sass_directory, :format => :sass)
        File.read(File.join(sass_directory, 'main.sass')).should match(%r(@import partials/base$))
        File.read(File.join(sass_directory, 'partials', '_base.sass')).should match(%r(@import "modules/all"$))

        FileUtils.remove_entry_secure sass_directory
      end
    end

    after(:all) do
      FileUtils.remove_entry_secure @temp_directory
    end
  end
end

describe Asphalt::Utils do
  describe '.format_import_directive' do
    it "returns import directives" do
      result = Asphalt::Utils.format_import_directive("partials", "foo")

      expect(result).to eq("@import 'partials/foo';")
    end

    it "takes a sass format argument" do
      result = Asphalt::Utils.format_import_directive("partials", "foo", :format => :sass)

      expect(result).to eq("@import partials/foo")
    end
  end

  describe '.last_import_statement' do
    it "retrieves the last 'import' statement" do
      scss_stylesheet = <<-SCSS
        @import 'foo/bar';
        @import 'bar';
        @import 'baz';

        .some_style {
          color: #FFF;
        }
      SCSS

      result = Asphalt::Utils.last_import_statement(scss_stylesheet)
      expect(result).to eq("@import 'baz';")
    end
  end
end
