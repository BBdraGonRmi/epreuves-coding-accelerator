def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def rotate_array_left(elements_array)
  rotated_array = Array.new(elements_array.length)
  rotated_array_index = 0
  for each_element in elements_array
    rotated_array[rotated_array_index - 1] = each_element
    rotated_array_index += 1
  end
  return rotated_array
end

def put_elements_in_a_string(elements, separator)
  elements_string = ""
  for each_elements in elements
    if each_elements == elements[-1]
      elements_string << each_elements
    else
      elements_string << (each_elements + separator)
    end
  end
  return elements_string
end


elements_array = arguments_are_present(ARGV)
elements_string = put_elements_in_a_string(rotate_array_left(elements_array), ", ")

puts elements_string
