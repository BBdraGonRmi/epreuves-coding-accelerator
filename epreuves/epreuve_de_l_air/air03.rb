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
def find_intruders(arguments)

  match_counter = 0
  intruders = []

  for each_argument in arguments

    for each_other_argument in arguments

      if each_argument == each_other_argument
        match_counter += 1
      end
    end

    if match_counter == 1

    intruders << each_argument

    else
      match_counter = 0
    end
  end

  return intruders
end

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
  intruders = find_intruders(arguments)
  separator = ", "

  puts concatanate_elements_to_string(intruders, separator)
end

main()
