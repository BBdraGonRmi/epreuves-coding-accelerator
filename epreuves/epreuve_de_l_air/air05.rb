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
  numbers = []
  for each_argument in arguments
    numbers << Integer(each_argument)
  end
  return numbers
end

def get_operator(arguments, index_of_arguments)
  operator = Integer(arguments[index_of_arguments])
  return operator
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

def compute_each_number(numbers, operator)
  computing_result_array = []
  for each_number in numbers
    computing_result_array << (each_number + operator)
  end
  return computing_result_array
end

def put_computed_numbers_in_string(numbers_array)
  string_numbers = numbers_array.join(" ")
  return string_numbers
end

arguments = numbers_are_valid(arguments_are_present(ARGV))
operator = get_operator(arguments, -1)
numbers = get_numbers(arguments, 1)
string_numbers = put_computed_numbers_in_string(compute_each_number(numbers, operator))

puts string_numbers
