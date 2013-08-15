module Asphalt
  module Utils
    def self.format_import_directive(directory, file, options={})
      if options[:format] == :sass
        "@import #{directory}/#{file}"
      else
        "@import '#{directory}/#{file}';"
      end
    end

    def self.last_import_statement(sass_content)
      regex = %r(^\s*(@import.+)$)
      sass_content.scan(regex).last.pop
    end
  end
end
