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

def skip_character_when_same(sentence)
  next_character_index = 1
  modified_sentence = ""
  for each_character in sentence.chars
    if each_character != sentence[next_character_index]
        modified_sentence << each_character
        next_character_index += 1
    else
      next_character_index += 1
    end
  end
  return modified_sentence
end


modified_sentence = skip_character_when_same(sentence_is_valid(arguments_are_valid(ARGV, 1)[0]))
puts modified_sentence
