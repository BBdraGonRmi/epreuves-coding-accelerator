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
def concatanate_elements_to_string(elements, separator)

  string_of_elements = ""

  for each_element in elements

    if each_element == elements[-1]
      string_of_elements << each_element

    else
      string_of_elements << (each_element + separator)
    end
  end

  return string_of_elements
end


#RESOLUTION & DISPLAY FUNCTION
def main()
  arguments = arguments_are_present(ARGV)
  elements = arguments[0, (arguments.length - 1)]
  separator = arguments[-1]

  string_of_elements = concatanate_elements_to_string(elements, separator)

  puts string_of_elements
end

main()
