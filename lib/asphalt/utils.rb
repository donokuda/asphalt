module Asphalt
  module Utils
    def self.add_import_statement(file_content, statement)
      file_content + "#{statement}\n"
    end

    def self.format_import_directive(directories, file, options={})
      if directories.empty?
        formatted_directories = nil
      else
        formatted_directories = "#{File.join(directories)}/"
      end

      if options[:format] == :sass
        "@import #{formatted_directories}#{file}"
      else
        "@import '#{formatted_directories}#{file}';"
      end
    end

    def self.last_import_statement(sass_content)
      regex = %r(^\s*(@import.+)$)
      sass_content.scan(regex).last.pop
    end

    def self.update_file!(file_path, content)
      previous_file_content = File.open(file_path, 'r').read

      file = File.open(file_path, 'w+')
      file << add_import_statement(previous_file_content, content)
      file.close
    end
  end
end
