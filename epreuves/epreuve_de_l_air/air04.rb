
#ERROR HANDLING FUNCTIONS
def arguments_are_valid(arguments, arguments_number)

  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit

  else
      return arguments
  end
end


#UTILITY FUNCTIONS
def skip_character_when_same(string)

  next_character_index = 1
  modified_string = ""

  for each_character in string.chars

    if each_character != string[next_character_index]

        modified_string << each_character
        next_character_index += 1

    else
      next_character_index += 1
    end
  end

  return modified_string
end

#RESOLUTION & DISPLAY FUNCTION
def main()

  argument = arguments_are_valid(ARGV, 1)[0]
  modified_string = skip_character_when_same(argument)

  puts modified_string
end

main()
