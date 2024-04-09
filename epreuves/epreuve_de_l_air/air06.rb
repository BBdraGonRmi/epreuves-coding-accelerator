#ERROR HANDLING FUNCTIONS
def arguments_are_present(arguments)

  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit

  else
      return arguments
  end
end


#UTILITY FUNCTIONS
def string_to_downcase(string)

  modified_string = ""

  for each_character in string.chars

    if each_character =~ /[A-Z]/
      modified_string << (each_character.ord + 32).chr

    else
      modified_string << each_character
    end

  end
  return modified_string
end

def elements_that_match(elements_array, string_to_match)

  modified_array = []

  for each_element in elements_array

    if string_to_downcase(each_element) =~ /#{string_to_downcase(string_to_match)}/
      modified_array << each_element
    end
  end

  return modified_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_present(ARGV)
  elements_array = arguments[0...arguments.length - 1]
  string_to_match = arguments[-1]

  matching_elements_string = elements_that_match(elements_array, string_to_match).join(", ")

  puts matching_elements_string
end

main()
