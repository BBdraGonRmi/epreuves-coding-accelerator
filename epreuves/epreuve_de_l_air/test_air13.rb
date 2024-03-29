class String
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
end

program = {
  "name"  =>
}

def load_file_names(folder_name, file_format)
  file_names_array = []
  files_in_folder = to_words_array(%x(ls), /\n/)
  for each_file in files_in_folder
    if each_file =~ file_format
      file_names_array << each_file
    end
  end
  return file_names_array
end

def to_words_array(sentence, string_separator)
  array_index = 0
  word = ""
  words_array = []
  for each_character in sentence.chars
    if each_character =~ string_separator
      words_array[array_index] = word
      word = ""
      array_index += 1
    else
      word << each_character
    end
  end
  return words_array
end


def test_output(program_name, argument)
  output = %x(ruby #{program_name} "#{argument}")
  if output == "Salut\nles\ngars\n"
    return true
  else
    return false
  end
end

def test_program_takes_one_argument(program_name)
  output = %x(ruby #{program_name} "argument")
  if output == "Usage: ruby program_name.rb arguments\n"
    return false
  else
    return true
  end
end

argument = "Salut les gars"

folder_name = "epreuve_de_l_air"
file_format = /^air\d\d.rb$/

file_names_array = load_file_names(folder_name, file_format)

success_counter = 0
test_counter = 0

for each_file in file_names_array
  test_result = test_program_takes_one_argument(each_file)

  test_counter += 1
  if test_result == true
    test_result = "success".green
    success_counter += 1
  else
    test_result = "failure".red
  end
  puts "#{each_file[0...-3]}: #{test_result}"
end

puts "..."
puts "Total success: (#{success_counter}/#{test_counter})"
