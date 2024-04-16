#UTILITY FUNCTIONS
def put_labyrinthe_in_a_matrix(string)
  matrix_line = []
  full_matrix = []
  matrix_column_index = 0
  string.each_char do |character|
    if character =~ /\n/
      matrix_column_index += 1
      full_matrix << matrix_line
      matrix_line = []
      next
    end
    next if character =~ /\r/
    next if character =~ /\$/
    character =~ /\s/ ? matrix_line << nil : matrix_line << character
  end
  full_matrix << matrix_line
  full_matrix.shift
  return full_matrix
end

def build_distances_matrix(labyrinthe)
  distances_matrix = []
  (0...labyrinthe.length).each do |i|
    distances_matrix << []
    (0...labyrinthe[0].length).each { |j| distances_matrix[i] << nil }
  end
  return distances_matrix
end

def find_the_entrance(labyrinthe)
  y_start, x_start = nil
  (0...labyrinthe.length).each do |i|
    (0...labyrinthe[0].length).each do |j|
      y_start, x_start = i, j if labyrinthe[i][j] == "1"
    end
  end
  return y_start, x_start
end

def find_the_exit(labyrinthe)
  y_exit, x_exit = nil
  (0...labyrinthe.length).each do |i|
    (0...labyrinthe[0].length).each do |j|
      y_exit, x_exit = i, j if labyrinthe[i][j] == "2"
    end
  end
  return y_exit, x_exit
end

def find_the_next_possible_steps(labyrinthe, y, x)
  nord_sud_est_ouest = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  next_possibles_steps = []
  (nord_sud_est_ouest).each do |c|
    if labyrinthe[(y + c[0])][(x + c[1])] == nil
      next_possibles_steps << [(y + c[0]), (x + c[1])]
    elsif labyrinthe[(y + c[0])][(x + c[1])] == "2"
      next_possibles_steps << [(y + c[0]), (x + c[1])]
    end
  end
  return next_possibles_steps
end

def find_minimum_distance(labyrinthe, distances_matrix)
  y_start, x_start = find_the_entrance(labyrinthe)
  y_exit, x_exit = find_the_exit(labyrinthe)
  steps_to_process = [[y_start, x_start]]
  distance_counter = 0
  next_possible_steps = []
  while steps_to_process != []

    p "steps to process: #{steps_to_process}"

    (steps_to_process).each do |step|
      if labyrinthe[(step[0])][(step[1])] == "2"

        labyrinthe.each do |raw|
          p raw
        end
        puts
        distances_matrix.each do |raw|
          p raw
        end
        puts

        return (distance_counter - 1)
      elsif labyrinthe[(step[0])][(step[1])] == nil || labyrinthe[(step[0])][(step[1])] == "1"
        labyrinthe[(step[0])][(step[1])] = true
        distances_matrix[(step[0])][(step[1])] = distance_counter

        p labyrinthe
        puts
        p distances_matrix

        steps_to_add = find_the_next_possible_steps(labyrinthe, step[0],step[1])
        steps_to_add.each { |step| next_possible_steps << step }

        p "next_possible_steps: #{next_possible_steps}"
        puts

      end
    end
    distance_counter += 1
    steps_to_process = []
    (next_possible_steps).each { |step| steps_to_process << step}
    next_possible_steps = []

    p "new steps to process: #{steps_to_process}"
    puts

  end
end

def convert_matrix_into_string(matrix)
  matrix_string = ""
  matrix.each do |row|
    matrix_string << row.join
    matrix_string << "\n"
  end
  return matrix_string
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
  arguments = arguments_are_valid(ARGV, 1)
  file = file_name_is_valid(arguments[0])
  return file
end

#RESOLUTION FUNCTION
def main()
  file = parse_arguments(ARGV)
  exit if !file
  labyrinthe = put_labyrinthe_in_a_matrix(file)
  distances_matrix = build_distances_matrix(labyrinthe)
  minimum_distance = find_minimum_distance(labyrinthe, distances_matrix)

  #labyrinthe_path = find_a_path(labyrinthe)
  #result = convert_matrix_into_string(labyrinthe_path)
  #display(result)
end

#DISPLAY FUNCTION
def display(string)
  puts string
end

main()
