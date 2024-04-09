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

def concatanate_elements_in_string_with_separator(elements, separator)

  elements_string = ""

  for each_element in elements

    if each_element == elements[-1]
      elements_string << each_element

    else
      elements_string << (each_element + separator)
    end
  end

  return elements_string
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_present(ARGV)
  intruders = find_intruders(arguments)
  separator = ", "

  puts concatanate_elements_in_string_with_separator(intruders, separator)
end

main()
