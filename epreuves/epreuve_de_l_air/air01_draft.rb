def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def get_sentence(arguments, index_of_arguments)
  return arguments[index_of_arguments]
end

def get_string_separator(arguments, index_of_arguments)
  return arguments[index_of_arguments]
end

def sentence_is_valid(sentence)
  for each_character in sentence.chars
      if Integer(each_character, exception: false) == nil
          return sentence
      else
          puts "Usage: argument must be a sentence"
          exit
      end
  end
end

def to_array(sentence, string_separator)
  array_index = 0
  sentence_index = 0
  separated_string = ""
  sentence_array = []
  string_separator_index = sentence =~ /#{string_separator}/

  if string_separator_index == nil
    return sentence
  else
    for each_character in sentence.chars
      if sentence_index == string_separator_index
        sentence_array[array_index] = separated_string
        separated_string = ""
        sentence_index += string_separator.length
        array_index += 1
      else
        separated_string << sentence[sentence_index]
        sentence_index += 1
      end
    end
  end
  sentence_array[array_index] = separated_string
  return sentence_array
end


argumrents = arguments_are_valid(ARGV, 2)
sentence = get_sentence(argumrents, 0)
string_separator = get_string_separator(arguments, 1)
sentence_array = to_array(sentence_is_valid(sentence, string_separator))

puts sentence_array
