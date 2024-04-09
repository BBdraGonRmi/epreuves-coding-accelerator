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
def get_each_element_of_string(string_to_split)

  array_index = 0
  element = ""
  elements_array = []

  for each_character in string_to_split.chars

    if each_character =~ /\s/
      elements_array[array_index] = element
      element = ""
      array_index += 1

    else
      element << each_character
    end
  end

  elements_array[array_index] = element
  return elements_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  argument = arguments_are_valid(ARGV, 1)
  elements_array = get_each_element_of_string(argument[0])

  puts elements_array
end

main()
