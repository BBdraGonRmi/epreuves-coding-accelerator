#ERROR HANDLING FUNCTIONS
def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def elements_are_numbers(elements_array)

  for each_element in elements_array

    if Integer(each_element, exception: false) == nil
      puts "Error: each element must be a number"
      exit
    end
  end

  numbers_array = elements_array
  return numbers_array
end

def array_is_sorted(numbers_array)

  for i in 0...(numbers_array.length - 1)

    if numbers_array[i] >= numbers_array[i + 1]
      puts "Error: numbers array is not sorted"
      exit
    end
  end

  return numbers_array
end


#UTILITY FUNCTIONS
def get_double_numbers_array(elements_array)

  first_array_insertion = true
  first_numbers_array = []
  second_numbers_array = []

  for each_argument in elements_array

    if each_argument =~ /^fusion$/
      first_array_insertion = false

    elsif first_array_insertion == true
      first_numbers_array << each_argument

    else
      second_numbers_array << each_argument
    end
  end

  return first_numbers_array, second_numbers_array
end

def fuse_two_sorted_arrays(first_numbers_array, second_numbers_array)

  fused_numbers_array = Array.new(first_numbers_array.length + second_numbers_array.length)
  first_numbers_array_index = 0
  second_numbers_array_index = 0

  for i in 0...fused_numbers_array.length

    if first_numbers_array[first_numbers_array_index] == nil
      fused_numbers_array[i] = second_numbers_array[second_numbers_array_index]
      break
    end

    if second_numbers_array[second_numbers_array_index] == nil
      fused_numbers_array[i] = first_numbers_array[first_numbers_array_index]
      break
    end

    if first_numbers_array[first_numbers_array_index] <= second_numbers_array[second_numbers_array_index]

      fused_numbers_array[i] = first_numbers_array[first_numbers_array_index]
      first_numbers_array_index += 1

    else
      fused_numbers_array[i] = second_numbers_array[second_numbers_array_index]
      second_numbers_array_index += 1
    end
  end

  return fused_numbers_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_present(ARGV)

  first_numbers_array, second_numbers_array = get_double_numbers_array(arguments)
  array_is_sorted(elements_are_numbers(first_numbers_array))
  array_is_sorted(elements_are_numbers(second_numbers_array))

  numbers_string = fuse_two_sorted_arrays(first_numbers_array, second_numbers_array).join(" ")

  puts numbers_string
end

main()
