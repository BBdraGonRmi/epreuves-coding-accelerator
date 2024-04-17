#UTILITY FUNCTIONS
def build_a_rectangle(length, height)
  rectangle = []
  if length > 1
    length_shape = "o" + "-" * (length - 2) + "o"
    height_shape = "|" + " " * (length - 2) + "|"
  else
    length_shape = "o"
    height_shape = "|"
  end
  rectangle << length_shape
  (height - 2).times { rectangle << height_shape }
  rectangle << length_shape if height > 1
  return rectangle
end

#ERROR HANDLING
def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb + #{arguments_number} arguments"
      return false
  else
      return arguments
  end
end

def parameters_are_digits(parameters)
  parameters.each do |character|
    if Integer(character, exception: false) == nil
      puts "Error: each size parameter must be a digit"
      return false
    end
  end
  return parameters
end

def parameters_are_greater_than_zero(parameters)
  parameters.each do |digit|
    if Integer(digit) < 1
      puts "Error: each size parameter must be greater than 0"
      return false
    end
  end
  return parameters
end

#PARSING
def parse_arguments(arguments)
  arguments = arguments_are_valid(ARGV, 2)
  if arguments && parameters_are_digits(arguments)
    parameters = parameters_are_greater_than_zero(arguments)
  end
  return parameters
end

#RESOLUTION
def main()
  parameters = parse_arguments(ARGV)
  exit if !parameters
  length = Integer(parameters[0])
  height = Integer(parameters[1])
  rectangle = build_a_rectangle(length, height)
  display(rectangle)
end

#DISPLAY
def display(array)
  array.each { |element| puts element }
end

main()
