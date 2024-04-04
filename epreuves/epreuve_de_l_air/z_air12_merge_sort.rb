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

def sort_array(numbers_array)

  if numbers_array.length <= 1
    return numbers_array
  end

  middle_array_index = numbers_array.length / 2
  left_array = numbers_array[0...middle_array_index]
  right_array = numbers_array[middle_array_index..-1]

  merge_arrays(sort_array(left_array), sort_array(right_array))

end


def merge_arrays(left_sorted_array, right_sorted_array)

  if left_sorted_array.length < 1
    sorted_array = right_sorted_array
    return sorted_array
  end

  if right_sorted_array.length < 1
    sorted_array = left_sorted_array
    return sorted_array
  end

  left_number = left_sorted_array[0]
  right_number = right_sorted_array[0]

  if left_number < right_number
    sorted_array = [left_sorted_array.shift]
  else
    sorted_array = [right_sorted_array.shift]
  end

  sorted_array << merge_arrays(left_sorted_array, right_sorted_array)
  return sorted_array.flatten
end

def put_modified_array_in_string(numbers_array)
  string_numbers = numbers_array.join(" ")
  return string_numbers
end

numbers_array = numbers_are_valid(arguments_are_present(ARGV))

puts "array is complitely sorted: #{put_modified_array_in_string(sort_array(numbers_array))}"
