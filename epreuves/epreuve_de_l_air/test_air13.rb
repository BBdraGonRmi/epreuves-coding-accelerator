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


argument = "Salut les gars"

folder_name = "epreuve_de_l_air"
file_format = /^air\d\d.rb$/

file_names_array = load_file_names(folder_name, file_format)

for each_file in file_names_array
  puts test_output(each_file, argument)
end
