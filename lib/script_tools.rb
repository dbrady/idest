# script_tools.rb
# Tools and utilities to support script/console, script/runner, and
#     RSpec runners.
# 
# PLEASE KEEP THIS FILE LIGHTWEIGHT. It gets loaded with every spec suite.

def require_all_files_in_folder(folder, extension = "*.rb")
  for file in Dir[File.join(File.dirname(__FILE__), '..', folder, "**/#{extension}")]
    require file
  end
end
