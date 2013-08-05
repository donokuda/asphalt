module Asphalt
  module Generator
    # FIXME: TOMDOC this method and all other methods
    def self.init!(directory)
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
        File.new(File.join(directory, scaffold_file), 'w+')

        if File.exists?(template_file_path)
          File.open(File.join(directory, scaffold_file), 'w+') do |f|
            f.write(File.read(template_file_path))
          end
        end
      end
    end
  end
end
