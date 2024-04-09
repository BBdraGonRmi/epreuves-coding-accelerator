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
def split_string_by_separator(string_to_split, string_separator)

  elements_array_index = 0
  string_to_split_index = 0
  element = ""
  elements_array = []
  string_separator_index = string_to_split =~ /#{string_separator}/

  if string_separator_index == nil
    return string_to_split

  else
    for i in 0...string_to_split.length

      if string_to_split[i] =~ /#{string_separator}/

        if element != ""
          elements_array[elements_array_index] = element
          element = ""
          elements_array_index += 1
        end

      else
        element << string_to_split[i]
        string_to_split_index += 1
      end
    end
  end

  elements_array[elements_array_index] = element
  return elements_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_valid(ARGV, 2)
  string_to_split = arguments[0]
  string_separator = [arguments[-1]]
  elements_array = split_string_by_separator(string_to_split, string_separator)

  puts elements_array
end

main()
