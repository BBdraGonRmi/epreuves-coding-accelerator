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


argument = ARGV
sentence = is_sentence(is_valid(argument, 2)[0])
string_separator = argument[1]
sentence_array = to_array(sentence, string_separator)

puts sentence_array
