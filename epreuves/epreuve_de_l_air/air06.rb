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

def get_string_to_match(arguments, index_of_arguments)
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

def word_to_downcase(word)
  modified_word = ""
  for each_character in word.chars
    if each_character =~ /[A-Z]/
      modified_word << (each_character.ord + 32).chr
    else
      modified_word << each_character
    end
  end
  return modified_word
end

def words_that_match(words, string_to_match)
  modified_array = []
  for each_word in words
    if word_to_downcase(each_word) =~ /#{word_to_downcase(string_to_match)}/
      modified_array << each_word
    end
  end
  return modified_array
end

def put_words_in_a_string(words, separator)
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

arguments = words_are_valid(arguments_are_present(ARGV))
words = get_words(arguments, (arguments.length - 1))
string_to_match = get_string_to_match(arguments, -1)

matching_words_string = put_words_in_a_string(words_that_match(words, string_to_match), ", ")

puts matching_words_string
