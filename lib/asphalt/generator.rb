module Asphalt
  module Generator
    def self.init!(directory)
      directories = ["modules", "partials", "vendors"]
      directories.each do |scaffold_dir|
        Dir.mkdir(File.join(directory, scaffold_dir)) unless Dir.exists?(File.join(directory, scaffold_dir))
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
        File.new(File.join(directory, scaffold_file), 'w+')
      end
    end
  end
end
