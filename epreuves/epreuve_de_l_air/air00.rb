def is_valid(argument, number)
  if argument.length != number
      puts "Usage: ruby terre11.rb argument"
      exit
  else
      return argument
  end
end

def is_sentence(sentence)
  for character in sentence.chars
      if Integer(character, exception: false) == nil
          return sentence
      else
          puts "Usage: argument must be a sentence"
          exit
      end
  end
end

def to_array(sentence, string_separator)
  array_index = 0
  word = ""
  sentence_array = []
  for character in sentence.chars
    if character =~ string_separator
      sentence_array[array_index] = word
      word = ""
      array_index += 1
    else
      word << character
    end
  end
  sentence_array[array_index] = word
  return sentence_array
end


argument = ARGV
sentence = is_sentence(is_valid(argument, 1)[0])
sentence_array = to_array(sentence, /\s/)

puts sentence_array
