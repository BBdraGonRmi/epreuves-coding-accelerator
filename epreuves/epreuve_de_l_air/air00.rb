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

def to_sentence_array(sentence, string_separator)
  array_index = 0
  word = ""
  sentence_array = []
  for each_character in sentence.chars
    if each_character =~ string_separator
      sentence_array[array_index] = word
      word = ""
      array_index += 1
    else
      word << each_character
    end
  end
  sentence_array[array_index] = word
  return sentence_array
end


sentence_array = to_sentence_array(sentence_is_valid(arguments_are_valid(ARGV, 1)[0]), /\s/)

puts sentence_array
