module Asphalt
  module Utils
    def self.format_import_directive(directory, file, options={})
      if options[:format] == :sass
        "@import #{directory}/#{file}"
      else
        "@import '#{directory}/#{file}';"
      end
    end
  end
end
