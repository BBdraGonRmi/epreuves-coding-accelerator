def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def numbers_are_valid(numbers)
  for each_number in numbers
    if Integer(each_number, exception: false) == nil
      puts "Usage: each argument must be a number"
      exit
    end
  end
  return numbers
end

def split_array(numbers_array)

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

  sort_arrays(pivot_number, split_array(left_array), split_array(right_array))
end


def sort_arrays(pivot_number, left_array, right_array)

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
  sorted_array << sort_arrays(pivot_number, left_array, right_array)
end

def put_modified_array_in_string(numbers_array)
  string_numbers = numbers_array.join(" ")
  return string_numbers
end

numbers_array = numbers_are_valid(arguments_are_present(ARGV))

puts "array is complitely sorted: #{put_modified_array_in_string(split_array(numbers_array))}"
