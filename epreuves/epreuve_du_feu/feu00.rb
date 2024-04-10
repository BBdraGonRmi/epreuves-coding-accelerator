#ERROR HANDLING FUNCTIONS
def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb + #{arguments_number} arguments"
      exit
  else
      return arguments
  end
end


def parameters_are_digits(parameters)
  for each_digit in parameters
    if Integer(each_digit, exception: false) == nil
      puts "Error: each size parameter must be a digit"
      exit
    end
  end
  return parameters
end

def parameters_are_greater_than_zero(parameters)
  for each_digit in parameters
    if Integer(each_digit) < 1
      puts "Error: each size parameter must be greater than 0"
      exit
    end
  end
  return parameters
end


#UTILITY FUNCTIONS
def build_a_rectangle(length, height)

  if length > 1
    length_shape = "o" + "-" * (length - 2) + "o"
    height_shape = "|" + " " * (length - 2) + "|"
  else
    length_shape = "o" * length
    height_shape = "|" * length
  end

  puts length_shape

  for i in 2...height
    puts height_shape
  end

  if height > 1
    puts length_shape
  end
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  arguments = arguments_are_valid(ARGV, 2)
  parameters = parameters_are_greater_than_zero(parameters_are_digits(arguments))
  length = Integer(parameters[0])
  height = Integer(parameters[1])

  build_a_rectangle(length, height)
end

main()
