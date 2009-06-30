require 'fileutils'

def copy(file_name, from_dir, to_dir)
  FileUtils.mkdir to_dir unless File.exist?(File.expand_path(to_dir))
  from = File.expand_path(File.join(from_dir,file_name))
  to = File.expand_path(File.join(to_dir, file_name))
  FileUtils.cp from, to, :verbose => true unless File.exist?(to)
end
 
def copy_image(file_name)
  from_dir = File.join(File.dirname(__FILE__), 'public/images')
  to_dir = File.join(RAILS_ROOT, 'public/images')
  copy file_name, from_dir, to_dir
end
 
def copy_stylesheet(file_name)
  from_dir = File.join(File.dirname(__FILE__), 'public/stylesheets')
  to_dir = File.join(RAILS_ROOT, 'public/stylesheets')
  copy file_name, from_dir, to_dir
end

copy_stylesheet 'flash_messages.css'
copy_image 'info.png'
copy_image 'success.png'
copy_image 'warning.png'
copy_image 'error.png'

File.readlines(File.dirname(__FILE__)+'/README').each { |line| puts line }
