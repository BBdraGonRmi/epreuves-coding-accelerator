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

  for each_element in elements

    if Integer(each_element, exception: false) == nil
      puts "Error: each element must be a number"
      exit
    end
  end

  numbers_array = elements_array
  return numbers_array
end


#UTILITY FUNCTIONS
def get_numbers(elements_array)

  numbers_array = []

  for each_element in elements_array
    numbers_array << Integer(each_elements)
  end

  return numbers_array
end

def compute_each_number(numbers_array, operator)

  results_array = []

  for each_number in numbers_array
    results_array << (each_number + operator)
  end

  return results_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_present(ARGV)
  arguments_are_numbers(arguments)
  operator = Integer(arguments[-1])
  numbers = get_numbers(arguments[0...-1])
  results_string = compute_each_number(numbers, operator).join(" ")

  puts results_string
end

main()
