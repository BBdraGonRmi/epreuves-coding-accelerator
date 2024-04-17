#UTILITY FUNCTIONS
def put_maze_in_a_matrix(string)
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
  title = full_matrix.shift
  return full_matrix, title
end

def find_the_entrance(maze)
  y_start, x_start = nil
  (0...maze.length).each do |i|
    (0...maze[0].length).each do |j|
      y_start, x_start = i, j if maze[i][j] == "1"
    end
  end
  return y_start, x_start
end

def find_the_exit(maze)
  y_exit, x_exit = nil
  (0...maze.length).each do |i|
    (0...maze[0].length).each do |j|
      y_exit, x_exit = i, j if maze[i][j] == "2"
    end
  end
  return y_exit, x_exit
end

def find_the_next_possible_steps(maze, y, x)
  nord_sud_est_ouest = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  next_possible_steps = []
  (nord_sud_est_ouest).each do |c|
    c_y = (y + c[0]) if (y + c[0]) >= 0 && (y + c[0]) <= maze.length
    c_x = (x + c[1]) if (x + c[1]) >= 0 && (x + c[1]) <= maze[y].length
    if c_y && c_x
      if maze[c_y][c_x] == nil
        next_possible_steps << [c_y, c_x]
      elsif maze[(y + c[0])][(x + c[1])] == "2"
        next_possible_steps << [(y + c[0]), (x + c[1])]
      end
    end
  end
  return next_possible_steps
end

def find_minimum_distance(maze)
  y_start, x_start = find_the_entrance(maze)
  y_exit, x_exit = find_the_exit(maze)
  predecessor = [y_start, x_start]
  steps_to_process = [[y_start, x_start]]
  distance_counter = 0
  next_possible_steps = []
  while steps_to_process != []
    (steps_to_process).each do |step|
      predecessor = [step[0], step[1]]
      steps_to_add = find_the_next_possible_steps(maze, step[0],step[1])
      steps_to_add.each do |step|
        if maze[step[0]][step[1]] == "2"
          maze[step[0]][step[1]] = predecessor
          return distance_counter
        else
          next_possible_steps << step
          maze[step[0]][step[1]] = predecessor
        end
      end
    end
    distance_counter += 1
    steps_to_process = []
    (next_possible_steps).each { |step| steps_to_process << step}
    next_possible_steps = []
  end

  return false
end

def find_the_path(maze, predecessors_maze)
  y_start, x_start = find_the_entrance(maze)
  y_exit, x_exit = find_the_exit(maze)
  path_step = predecessors_maze[y_exit][x_exit]
  while predecessors_maze[path_step[0]][path_step[1]] != "1"
    maze[path_step[0]][path_step[1]] = "o"
    path_step = predecessors_maze[path_step[0]][path_step[1]]
  end
  return maze
end

def convert_maze_into_string(maze, title)
  maze_string = ""
  title.each do |element|
    if element == nil
      maze_string << " "
    else
      maze_string << element
    end
  end
  maze_string << "\n"
  maze.each do |row|
    row.each do |element|
      if element == nil
        maze_string << " "
      else
        maze_string << element
      end
    end
    maze_string << "\n"
  end
  return maze_string
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

def file_name_is_valid(file_name)
  begin
    file = File.open(file_name)
  rescue Errno::ENOENT
    puts "Error: file not found"
    return false
  end
  return file
end

#PARSING
def parse_arguments(arguments)
  arguments = arguments_are_valid(ARGV, 1)
  file = file_name_is_valid(arguments[0])
  return file
end

#RESOLUTION
def main()
  file = parse_arguments(ARGV)
  exit if !file
  predecessors_maze, title = put_maze_in_a_matrix(file)
  minimum_distance = find_minimum_distance(predecessors_maze)
  maze, title = put_maze_in_a_matrix(parse_arguments(ARGV))
  if !minimum_distance
    puts "Error: unsolvable maze"
    result = convert_maze_into_string(maze, title)
  else
    maze_path = find_the_path(maze, predecessors_maze)
    result = convert_maze_into_string(maze_path, title)
  end
  display(result)
end

#DISPLAY
def display(string)
  print string
end

main()
