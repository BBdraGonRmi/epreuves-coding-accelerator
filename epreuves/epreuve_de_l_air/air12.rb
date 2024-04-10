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


#UTILITY FUNCTIONS
def split_array_around_pivot_number(numbers_array)

  if numbers_array.length <= 1
    return numbers_array
  end

  left_array = []
  right_array = []
  pivot_number = numbers_array[-1]
  left_array_index = 0
  numbers_array.pop

  for each_number in numbers_array

    if numbers_array[left_array_index] > pivot_number
      right_array << numbers_array[left_array_index]
      left_array_index += 1

    else
      left_array << numbers_array[left_array_index]
      left_array_index += 1
    end
  end

  quick_sort_arrays(pivot_number, split_array_around_pivot_number(left_array), split_array_around_pivot_number(right_array))
end


def quick_sort_arrays(pivot_number, left_array, right_array)

  if left_array.length < 1
    sorted_array = [pivot_number, right_array]
    return sorted_array
  end

  if right_array.length < 1
    sorted_array = [left_array, pivot_number]
    return sorted_array
  end

  sorted_array = [left_array, pivot_number, right_array].flatten
  return sorted_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_present(ARGV)
  numbers_array = elements_are_numbers(arguments)

  puts split_array_around_pivot_number(numbers_array).join(" ")
end

main()
