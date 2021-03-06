require 'tempfile'
require 'pathname'
require 'asphalt'

def create_temp_directory
  @temp_directory ||= Dir.mktmpdir
end

def remove_temp_directory
  FileUtils.remove_entry_secure @temp_directory
  @temp_directory = nil
end
