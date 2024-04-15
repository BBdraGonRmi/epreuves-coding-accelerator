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

def file_name_is_valid(file_name)
  begin
    file = File.open(file_name)
  rescue Errno::ENOENT
    puts "Error: file not found"
    exit
  end
  return file
end

#UTILITY FUNCTIONS
def generate_board_file(x, y, density)
  if File.exist?("map_.txt")
    File.open("map_.txt", "w") { |f|
    f.write "#{y}.xo\n"
    (0...y).each do |i|
      (0...x).each do |j|
        f.write ((rand(y) * 2 < density) ? "x" : ".")
      end
      f.write "\n"
    end
    f.close
    }
  end
  File.foreach("map_.txt") { |line| puts line }
end

#RESOLUTION FUNCTION
def main()
  if ARGV.length == 0
    generate_board_file(rand(20...50), rand(20...50), 1)
  else
    arguments = arguments_are_valid(ARGV, 3)
    parameters = parameters_are_greater_than_zero(parameters_are_digits(arguments))
    x = Integer(parameters[0])
    y = Integer(parameters[1])
    density = Float(parameters[2])
    generate_board_file(x, y, density)
  end
end

main()
