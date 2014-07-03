require 'spec_helper'

describe Asphalt::Utils, '.format_import_directive' do
  it "returns import directives" do
    result = Asphalt::Utils.format_import_directive("partials", "foo")

    expect(result).to eq("@import 'partials/foo';")
  end

  it "takes a sass format argument" do
    result = Asphalt::Utils.format_import_directive("partials", "foo", :format => :sass)

    expect(result).to eq("@import partials/foo")
  end
end

describe Asphalt::Utils, '.last_import_statement' do
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

describe Asphalt::Utils, '.add_import_statement' do
  it 'adds an import statement to a sass file' do
    scss_stylesheet = <<-SCSS
      @import 'foo/bar';
      @import 'bar';

      .some_style {
        color: #FFF;
      }
    SCSS

    expected = <<-SCSS
      @import 'foo/bar';
      @import 'bar';

      .some_style {
        color: #FFF;
      }
      @import 'baz';
    SCSS

    result = Asphalt::Utils.add_import_statement(scss_stylesheet, "@import 'baz';")
    expect(result).to eq expected
  end
end

describe Asphalt::Utils, ".update_file" do
  it "updates a sass file" do
    sass_directory = Dir.mktmpdir
    scss_content = <<-SCSS
      @import 'foo/bar';
      @import 'bar';

      .some_style {
        color: #FFF;
      }
    SCSS

    expected = <<-SCSS
      @import 'foo/bar';
      @import 'bar';

      .some_style {
        color: #FFF;
      }
      @import 'baz';
    SCSS

    sass_file_path = File.join(sass_directory, 'sass_file.scss')
    sass_file = File.new(sass_file_path, 'w+')
    sass_file << scss_content
    sass_file.close

    Asphalt::Utils.update_file(sass_file_path, "@import 'baz';")

    new_sass_content = File.open(sass_file_path, 'r').read

    expect(new_sass_content).to eq(expected)

    FileUtils.remove_entry_secure sass_directory
  end
end
