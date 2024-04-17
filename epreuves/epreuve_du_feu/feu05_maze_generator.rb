#CONSTANT
FILE = "feu05_maze.txt"

#UTILITY FUNCTIONS
def generate_maze_file(file, height, width, characters, gates)
  entry_gate = rand(width - 4) + 2
  exit_gate = rand(width - 4) + 2
  File.open(file, "w") { |f|
    f.write "#{height}x#{width}#{characters}#{gates}\n"
    height.times do |y|
      width.times do |x|
        if y == 0 && x == entry_gate
          f.write characters[3].chr
        elsif y == (height - 1) && x == exit_gate
          f.write characters[4].chr
        elsif y.between?(1, height - 2) && x.between?(1, width - 2) && rand(100) > 20
          f.write characters[1].chr
        else
          f.write characters[0].chr
        end
      end
      f.write "#{gates}\n"
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

def parameter_length_is_valid(parameter, parameter_length)
  if parameter.length != parameter_length
    puts "Error: parameter length must be #{parameter_length}"
    return false
  else
    return parameter
  end
end

#PARSING
def parse_arguments(arguments)
  if arguments.length == 0
    height, width, characters, gates = rand(10...20), rand(20...50), "* o12", "$"
  else
    arguments = arguments_are_valid(ARGV, 4)
    if arguments
      if parameters_are_digits([arguments[0], arguments[1]])
        digit_parameters = parameters_are_greater_than_zero([arguments[0], arguments[1]])
        height, width = Integer(arguments[0]), Integer(arguments[1])
      end
      characters = parameter_length_is_valid(arguments[2], 5)
      gates = parameter_length_is_valid(arguments[3], 1)
    end
  end
  return height, width, characters, gates
end

#RESOLUTION
def main()
  height, width, characters, gates = parse_arguments(ARGV)
  exit if !height || !width || !characters || !gates
  generate_maze_file(FILE, height, width, characters, gates)
  display(FILE)
end

#DISPLAY
def display(file)
  File.foreach(file) { |line| print line }
end

main()
