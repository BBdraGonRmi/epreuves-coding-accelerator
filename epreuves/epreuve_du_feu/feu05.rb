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
  arguments_are_valid(ARGV, 4) ? arguments = arguments_are_valid(ARGV, 4) : return
  if parameters_are_greater_than_zero(parameters_are_digits([arguments[0], arguments[1], arguments[3]]))
    digit_parameters = parameters_are_greater_than_zero(parameters_are_digits([arguments[0], arguments[1], arguments[3]]))
  else
    return false
  height, width, gates = Integer(arguments[0]), Integer(arguments[1]), Integer(arguments[3])
  parameter_length_is_valid(arguments[2], 5) ? characters = arguments[2] : return
  end
end

#RESOLUTION FUNCTION
def main()
  file_name_is_valid("feu05_labyrinthe.txt") ? file = file_name_is_valid("feu05_labyrinthe.txt") : exit
  if ARGV.length == 0
    generate_labyrinthe_file(file, rand(10...20), rand(10...20), "* o12", "$")
  else
    exit if !parse_arguments(ARGV)
    generate_labyrinthe_file(file, height, width, characters, gates)
  end
  display(file)
end

#DISPLAY FUNCTION
def display(file)
  File.foreach(file) { |line| print line }
end

main()
