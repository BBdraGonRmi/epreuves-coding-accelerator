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
def rotate_array_left(elements_array)

  rotated_array = Array.new(elements_array.length)
  rotated_array_index = 0

  for each_element in elements_array
    rotated_array[rotated_array_index - 1] = each_element
    rotated_array_index += 1
  end

  return rotated_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  elements_array = arguments_are_present(ARGV)
  elements_string = rotate_array_left(elements_array).join(", ")

  puts elements_string
end

main()
