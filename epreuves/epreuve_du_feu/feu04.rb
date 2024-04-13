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
  parameters.each do |character|
    if Integer(character, exception: false) == nil
      puts "Error: each size parameter must be a digit"
      exit
    end
  end
  return parameters
end

def parameters_are_greater_than_zero(parameters)
  parameters.each do |digit|
    if Integer(digit) < 1
      puts "Error: each size parameter must be greater than 0"
      exit
    end
  end
  return parameters
end

#UTILITY FUNCTIONS
def generate_board(x, y, density)
  #arguments = arguments_are_valid(ARGV, 3)
  parameters = parameters_are_digits([x, y, density])
  parameters = parameters_are_greater_than_zero(parameters_are_digits([x, y, density]))
  x = Integer(parameters[0])
  y = Integer(parameters[1])
  density = Float(parameters[2])
  puts "#{y}.xo"
  (0...y).each do |i|
    (0...x).each do |j|
      print ((rand(y) * 2 < density) ? "x" : ".")
    end
    puts
  end
end


def put_string_in_a_matrix(string, nil_character)
  matrix_line = []
  full_matrix = []
  matrix_column_index = 0
  file.each_char do |character|
    if character =~ /\n/
      matrix_column_index += 1
      full_matrix << matrix_line
      matrix_line = []
      next
    end
    next if character =~ /\r/
    matrix_line << character
  end
  full_matrix << matrix_line
  return full_matrix
end

generate_board(1, 1, 1)
