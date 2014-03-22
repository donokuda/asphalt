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
