def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def get_words(arguments, number_of_arguments)
  return arguments[0, number_of_arguments]
end

def get_string_separator(arguments, index_of_arguments)
  return arguments[index_of_arguments]
end

def words_are_valid(words)
  for each_word in words
    for each_character in each_word.chars
        if Integer(each_character, exception: false) == nil
            return words
        else
            puts "Usage: each argument must be a word"
            exit
        end
    end
  end
end

def put_words_in_a_sentence(words, separator)
  sentence = ""
  for each_word in words
    if each_word == words[-1]
      sentence << each_word
    else
      sentence << (each_word + separator)
    end
  end
  return sentence
end


arguments = arguments_are_present(ARGV)
words = get_words(arguments, (arguments.length - 1))
string_separator = get_string_separator(arguments, -1)

sentence = put_words_in_a_sentence(words_are_valid(words), string_separator)

puts sentence
