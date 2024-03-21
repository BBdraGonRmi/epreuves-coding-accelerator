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

  if numbers_array.length <= 1 # Base case 1 (array_length == 1)
    return numbers_array
  end

  # Cut array in two parts
  middle_array_index = numbers_array.length / 2
  left_array = numbers_array[0...middle_array_index]
  right_array = numbers_array[middle_array_index..-1]

  puts "left array: #{left_array}"
  puts "right array: #{right_array}"

  #left_sorted_array = sort_array(left_array)
  #right_sorted_array = sort_array(right_array)

  #merge_arrays(left_sorted_array, right_sorted_array)

  merge_arrays(sort_array(left_array), sort_array(right_array))

end


def merge_arrays(left_sorted_array, right_sorted_array)

  #sorted_array = []
  puts "left sorted array: #{left_sorted_array}"
  puts "right sorted array: #{right_sorted_array}"

  if left_sorted_array.length < 1
    return right_sorted_array
  end

  if right_sorted_array.length < 1
    return left_sorted_array
  end

  if left_sorted_array[0] < right_sorted_array[0]
    smallest_number = left_sorted_array.shift
  else
    smallest_number = right_sorted_array.shift
  end



  [smallest_number].concat(merge_arrays(left_sorted_array, right_sorted_array))

  #sorted_array.concat(left_sorted_array).concat(right_sorted_array)



end

def merge_sort(array)
  return array if array.length <= 1

  middle = array.length / 2
  left = array[0...middle]
  right = array[middle..-1]

  merge_arrays(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted.concat(left).concat(right)

end

def merges(left_array, right_array)
  if right_array.length < 1
    return left_array
  end

  if left_array.length < 1
    return right_array
  end

  smallest_number = if left_array.first <= right_array.first
    left_array.shift
  else
    right_array.shift
  end

  #recursive = merge(left_array, right_array)

  [smallest_number].concat(merge(left_array, right_array))
end

numbers_array = numbers_are_valid(arguments_are_present(ARGV))

puts "array is complitely sorted: #{merge_sort(numbers_array)}"

puts "array is complitely sorted: #{sort_array(numbers_array)}"
