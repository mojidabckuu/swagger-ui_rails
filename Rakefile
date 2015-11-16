require 'fileutils'
require 'bundler/gem_tasks'

desc 'Syncronize Swagger UI'
task :sync_swagger_ui do

  swagger_root = 'swagger'

  source = File.join File.dirname(__FILE__), 'swagger-ui-src', 'dist'
  assets = File.join File.dirname(__FILE__), 'app', 'assets'

  images_folder = File.join(assets, 'images', swagger_root)
  javascripts_folder = File.join(assets, 'javascripts', swagger_root)
  stylesheets_folder = File.join(assets, 'stylesheets', swagger_root)
  Dir.mkdir(images_folder) unless File.exist?(images_folder)
  Dir.mkdir(javascripts_folder) unless File.exist?(javascripts_folder)
  Dir.mkdir(stylesheets_folder) unless File.exist?(stylesheets_folder)

  index = File.join File.dirname(__FILE__), 'lib', 'swagger-ui_rails', 'index.js'

  File.read(index).each_line do |line|
    if line =~ /require (.*)/
      directory = File.dirname("#{$1.strip}")
      directory.slice! './'
      Dir.mkdir(File.join javascripts_folder, directory) unless File.exist?(File.join javascripts_folder, directory)
      file = "#{source}/#{$1.strip}"
      FileUtils.cp_r file, file.gsub(source, javascripts_folder), verbose: true
    end
  end
  FileUtils.cp_r index, javascripts_folder, verbose: true

  index = File.join File.dirname(__FILE__), 'lib', 'swagger-ui_rails', 'index.css'

  File.read(index).each_line do |line|
      if line =~ /require (.*)/
        directory = File.dirname("#{$1.strip}")
        directory.slice! './'
        Dir.mkdir(File.join stylesheets_folder, directory) unless File.exist?(File.join stylesheets_folder, directory)
        file = "#{source}/#{$1.strip}"
        FileUtils.cp_r file, file.gsub(source, stylesheets_folder), verbose: true
      end
  end
  FileUtils.cp_r index, stylesheets_folder, verbose: true

  index = File.join File.dirname(__FILE__), 'lib', 'swagger-ui_rails', 'index.img'

  File.read(index).each_line do |line|
    if line =~ /require (.*)/
      directory = File.dirname("#{$1.strip}")
      directory.slice! './'
      Dir.mkdir(File.join images_folder, directory) unless File.exist?(File.join images_folder, directory)
      file = "#{source}/#{$1.strip}"
      FileUtils.cp_r file, file.gsub(source, images_folder), verbose: true
    end
  end

end
