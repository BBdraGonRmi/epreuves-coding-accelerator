def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
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
    while sentence_index < sentence.length
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


sentence_array = to_array(sentence_is_valid(arguments_are_valid(ARGV, 2)[0]), ARGV[1])

puts sentence_array
