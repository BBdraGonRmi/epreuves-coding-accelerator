def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def get_numbers(arguments, number_of_arguments_to_pop)
  arguments.pop(number_of_arguments_to_pop)
  numbers_array = []
  for each_argument in arguments
    numbers_array << Integer(each_argument)
  end
  return numbers_array
end

def get_element_to_insert(arguments, index_of_arguments)
  new_element = Integer(arguments[index_of_arguments])
  return new_element
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

def insert_in_sorted_array(numbers_array, new_element)
  modified_numbers_array = []
  number_inserted = false
  for each_number in numbers_array
    if number_inserted == false
      if new_element <= each_number
        number_inserted = true
        modified_numbers_array << new_element
      end
    end
    modified_numbers_array << each_number
  end
  if number_inserted == false
    modified_numbers_array << new_element
  end
  return modified_numbers_array
end

def put_modified_array_in_string(numbers_array)
  string_numbers = numbers_array.join(" ")
  return string_numbers
end


arguments = numbers_are_valid(arguments_are_present(ARGV))
new_element = get_element_to_insert(arguments, -1)
numbers_array = get_numbers(arguments, 1)

string_numbers = put_modified_array_in_string(insert_in_sorted_array(numbers_array, new_element))

puts string_numbers
