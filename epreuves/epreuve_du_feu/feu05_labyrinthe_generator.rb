#UTILITY FUNCTIONS
def generate_labyrinthe_file(file, height, width, characters, gates)
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
end

#ERROR HANDLING FUNCTIONS
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

def file_name_is_valid(file_name)
  begin
    file = File.open(file_name)
  rescue Errno::ENOENT
    puts "Error: file not found"
    return false
  end
  return file
end

#PARSING FUNCTIONS
def parse_arguments(arguments)
  arguments = arguments_are_valid(ARGV, 5)
  file = file_name_is_valid(arguments[0])
  if parameters_are_digits([arguments[1], arguments[2]])
    digit_parameters = parameters_are_greater_than_zero([arguments[1], arguments[2]])
    height, width = Integer(arguments[1]), Integer(arguments[2])
  end
  characters = parameter_length_is_valid(arguments[3], 5)
  gates = parameter_length_is_valid(arguments[4], 1)
  return file, height, width, characters, gates
end

#RESOLUTION FUNCTION
def main()
  file_name_is_valid("feu05_labyrinthe.txt") ? file = file_name_is_valid("feu05_labyrinthe.txt") : exit
  if ARGV.length == 0
    generate_labyrinthe_file(file, rand(10...20), rand(20...50), "* o12", "$")
  else
    file, height, width, characters, gates = parse_arguments(ARGV)
    exit if !file || !height || !width || !characters || !gates
    generate_labyrinthe_file(file, height, width, characters, gates)
  end
  display(file)
end

#DISPLAY FUNCTION
def display(file)
  File.foreach(file) { |line| print line }
end

main()
