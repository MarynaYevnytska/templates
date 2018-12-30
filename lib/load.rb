require 'yaml'
module Load
  def save(object, file_path)
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.open(file_path, 'a') { |file| file.write(YAML.dump(object)) }
  end

  def load(file_path) #hash
    YAML::load( File.open( file_path ) )
  end

  def load_documents (file_path)
    YAML::load_documents(File.open(file_path))
  end

  def load_all_documents (file_path)
    File.open( file_path ) do |yml_file|
      YAML.load_documents( yml_file ) do |yml_doc|
      end
    end
  end

  def load_as_file(file_path)
    YAML::load_file(file_path)
  end

  def load_as_stream(file_path)
    YAML::load_stream( File.open( file_path ) )
  end

  def load_to_string(file_path)
    File.open(file_path, &:read)
  end

end
