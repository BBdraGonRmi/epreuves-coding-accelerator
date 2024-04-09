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
def get_numbers(elements_array)

  numbers_array = []

  for each_element in elements_array
    numbers_array << Integer(each_element)
  end

  return numbers_array
end

def insert_element_in_sorted_array(numbers_array, element_to_insert)

  modified_numbers_array = []
  number_inserted = false

  for each_number in numbers_array

    if number_inserted == false

      if element_to_insert <= each_number
        number_inserted = true
        modified_numbers_array << element_to_insert
      end
    end

    modified_numbers_array << each_number
  end

  if number_inserted == false
    modified_numbers_array << element_to_insert
  end

  return modified_numbers_array
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_present(ARGV)
  elements_are_numbers(arguments)

  element_to_insert = Integer(arguments[-1])
  numbers_array = get_numbers(arguments[0...-1])
  array_is_sorted(numbers_array)

  numbers_string = insert_element_in_sorted_array(numbers_array, element_to_insert).join(" ")

  puts numbers_string
end

main()
