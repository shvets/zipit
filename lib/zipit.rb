require 'zip/zip'

class Zipit
  def create_zip_file params
    file_name = params[:file_name]
    dir = params[:dir]
    @global_excludes = params[:global_excludes].nil? ? [] : params[:global_excludes]
    @includes = params[:includes].nil? ? [] : params[:includes]
    @excludes = params[:excludes].nil? ? [] : params[:excludes]

    Zip::ZipOutputStream.open(file_name) do |zos|
      zip(zos, dir, dir)
    end
  end

  def zip zos, name, basedir
    Dir.new(name).each do |filename|
      if(filename != '.' and filename != '..')
        full_name = name + '/' + filename

        if File.directory? full_name
          zip(zos, full_name, basedir)
        else
          new_name = full_name[basedir.length+1..full_name.length]
          
          if (match?(new_name, @global_excludes) or match?(new_name, @excludes)) and
            not match?(new_name, @includes)
            ;
          else
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
      return true if File.fnmatch(pattern, name) or name =~ /^#{pattern}/
    end

    false
  end   
end

def zip_cmd_line params
  zipit = Zipit.new

  archive = params[0].nil? ? "default.zip" : params[0]
  dir = params[1].nil? ? "." : params[1]

  zipit.create_zip_file( 
    :file_name => archive, :dir => dir,
    :global_excludes => ['.svn', '.git'], :excludes => [archive])
end  

def zip params
  zipit = Zipit.new
  
  archive = params[:archive].nil? ? "default.zip" : params[:archive]
  dir = params[:dir].nil? ? "." : params[:dir]

  zipit.create_zip_file( 
    :file_name => archive, :dir => dir,
    :global_excludes => ['.svn', '.git'], :excludes => [archive])
end