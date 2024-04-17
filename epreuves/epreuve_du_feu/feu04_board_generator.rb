#CONSTANT
FILE = "feu04_board.txt"

#UTILITY FUNCTIONS
def generate_board_file(file, x, y, density)
  File.open(file, "w") { |f|
  f.write "#{y}.xo\n"
  (0...y).each do |i|
    (0...x).each do |j|
      f.write ((rand(y) * 2 < density) ? "x" : ".")
    end
    f.write "\n"
  end
  f.close
  }
  return file
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
  if arguments.length == 0
    x, y, density = rand(20...50), rand(20...50), 1
  else
    arguments = arguments_are_valid(ARGV, 3)
    if arguments
      if parameters_are_digits([arguments[0], arguments[1], arguments[2]])
        parameters = parameters_are_greater_than_zero([arguments[0], arguments[1], arguments[2]])
        x, y, density = Integer(parameters[0]), Integer(parameters[1]), Integer(parameters[2])
      end
    end
  end
  return x, y, density
end

#RESOLUTION FUNCTION
def main()
  x, y, density = parse_arguments(ARGV)
  exit if !x || !y || !density
  generate_board_file(FILE, x, y, density)
  display(FILE)
end

#DISPLAY
def display(file)
  File.foreach(file) { |line| print line }
end

main()
