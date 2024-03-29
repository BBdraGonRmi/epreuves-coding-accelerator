def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def file_name_is_valid(file_name)
  begin
    file = File.open(file_name)
  rescue Errno::ENOENT
    puts "Error: file not found"
    exit
  end
  return file
end

def read_file(file)
  file_data = file.read
  return file_data
end


puts read_file(file_name_is_valid(arguments_are_valid(ARGV, 1)[0]))
