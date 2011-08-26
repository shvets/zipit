require 'zip/zip'

class Zipit
  attr_reader :global_excludes, :includes, :excludes

  def zip_cmd_line params
    archive = params[0].nil? ? "#{File.basename(Dir.pwd)}.zip" : params[0]
    dir = params[1].nil? ? "." : params[1]

    @includes = params[:includes].nil? ? [] : params[:includes]
    @excludes = params[:excludes].nil? ? [] : params[:excludes]
    @global_excludes = params[:global_excludes].nil? ? [] : params[:global_excludes]

    @excludes += [archive]
    @global_excludes += ['.svn', '.git']

    create_zip_file(:file_name => archive, :dir => dir)
  end

  def zip params
    archive = params[:archive].nil? ? "#{File.basename(Dir.pwd)}.zip" : params[:archive]
    dir = params[:dir].nil? ? "." : params[:dir]

    @includes = params[:includes].nil? ? [] : params[:includes]
    @excludes = params[:excludes].nil? ? [] : params[:excludes]
    @global_excludes = params[:global_excludes].nil? ? [] : params[:global_excludes]

    @excludes += [archive]
    @global_excludes += ['.svn', '.git']

    create_zip_file(:file_name => archive, :dir => dir)
  end

  private

  def create_zip_file params
    file_name = params[:file_name]
    dir = params[:dir]

    Zip::ZipOutputStream.open(file_name) do |zos|
      zip_stream(zos, dir, dir)
    end
  end

  def zip_stream zos, name, basedir
    Dir.new(name).each do |filename|
      if(filename != '.' and filename != '..')
        full_name = name + '/' + filename

        if File.directory? full_name
          if not match?(full_name, global_excludes) and not match?(full_name, excludes) and not match?(full_name, includes)
            zip_stream(zos, full_name, basedir)
          end
        else
          new_name = full_name[basedir.length+1..full_name.length]

          if not (match?(new_name, global_excludes) and not match?(new_name, excludes)) and not match?(new_name, includes)
            puts "Adding #{new_name} ..."
            # Create a new entry with some arbitrary name
            zos.put_next_entry(new_name)
            # Add the contents of the file, don't read the stuff linewise if its binary, instead use direct IO
            zos.print IO.read(name + '/' + filename)
          end
        end
      end
    end
  end

  def match? name, list
    list.each do |pattern|
      return true if File.fnmatch(pattern, name) or name =~ /#{pattern}/
    end

    false
  end

end

def zip params
  zipit = Zipit.new

  zipit.zip params
end

def zip_cmd_line params
  zipit = Zipit.new

  zipit.zip_cmd_line params
end