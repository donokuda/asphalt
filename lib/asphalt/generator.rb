module Asphalt
  module Generator
    # FIXME: TOMDOC this method and all other methods
    def self.init!(directory, options = {})
      directories = ["modules", "partials", "vendors"]
      directories.each do |scaffold_dir|
        FileUtils.mkdir_p(File.join(directory, scaffold_dir)) unless Dir.exists?(File.join(directory, scaffold_dir))
      end

      files = ['main.scss',
               'modules/_all.scss',
               'modules/_utility.scss',
               'modules/_colors.scss',
               'partials/_base.sass',
               'partials/_buttons.scss',
               'partials/_figures.scss',
               'partials/_grids.scss',
               'partials/_typography.scss',
               'partials/_reset.scss']

      files.each do |scaffold_file|
        template_file_path = File.join(File.dirname(__FILE__), 'templates', scaffold_file)

        scaffold_directory = File.dirname(scaffold_file)
        scaffold_filename  = File.basename(scaffold_file, File.extname(scaffold_file))

        if scaffold_file == 'partials/_base.sass'
          scaffold_ext = '.sass'
        else
          scaffold_ext = options[:format] == :sass ? ".sass" : ".scss"
        end

        scaffold_file_path = File.join(scaffold_directory, scaffold_filename + scaffold_ext)

        target_file =  File.new(File.join(directory, scaffold_file_path), 'a+')

        if File.exists?(template_file_path)
          if options[:format] == :sass && File.extname(template_file_path) == '.scss'
            target_file.write(`sass-convert #{ template_file_path } -F scss -T sass`)
          else
            target_file.write(File.read(template_file_path))
          end
          target_file.close
        end
      end
    end
  end
end
