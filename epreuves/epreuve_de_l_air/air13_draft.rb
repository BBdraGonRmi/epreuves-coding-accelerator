def file_name_is_valid(file_name)
  begin
    file = File.open(file_name)
  rescue Errno::ENOENT
    puts "Error: #{file_name} file not found"
    exit
  end
  return file
end

def load_file_names()
  file_names_array = []
  for i in 0..12
    if i < 10
      file_names_array << "air0#{i}.rb"
    else
      file_names_array << "air#{i}.rb"
    end
    file_name_is_valid(file_names_array[i])
  end
  return file_names_array
end

#puts read_file(file_name_is_valid(arguments_are_valid(ARGV, 1)[0]))

puts load_file_names()
