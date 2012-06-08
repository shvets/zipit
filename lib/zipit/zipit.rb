#require 'zip/zip'

require 'zip_dsl/zip_dsl'
require 'directory_scanner'

class Zipit
  attr_reader :global_excludes, :includes, :excludes

  def zip params
    includes = params[:includes].nil? ? [] : params[:includes]
    excludes = params[:excludes].nil? ? [] : params[:excludes]
    #@global_excludes = params[:global_excludes].nil? ? [] : params[:global_excludes]
    #
    excludes << params[:archive]
    #@global_excludes << '.svn'
    #@global_excludes << '.git'

    create_zip_file(params[:dir], params[:archive], includes, excludes)
  end

  private

  def create_zip_file dir, file_name, includes, excludes
    scanner = DirectoryScanner.new
    files = scanner.scan dir, includes, excludes

    builder = Zip::DSL.new file_name

    builder.build do
      files.each do |name|
        full_name = "#{dir}/#{name}"
        if File.directory? full_name
          directory :from_dir => full_name
        else
          to_dir =  "#{dir}/#{File.dirname(name)}"
          file :name => full_name, :to_dir => to_dir
        end
      end
    end
  end
end
