module Asphalt
  module Utils
    def self.format_import_directive(directory, file)
      "@import '#{directory}/#{file}';"
    end
  end
end
