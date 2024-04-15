#ERROR HANDLING FUNCTIONS
def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb + #{arguments_number} arguments"
      exit
  else
      return arguments
  end
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
def put_string_in_a_matrix(string)
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
    matrix_line << character
  end
  full_matrix << matrix_line
  full_matrix.shift
  return full_matrix
end

def find_a_square(board, row_index, column_index)
  raw_length = board.length - row_index
  column_length = board[1].length - column_index
  (row_index...board.length).each do |i|
    raw_length = (i - row_index)
    (column_index...board[i].length).each do |j|
      return raw_length if raw_length >= column_length
      if board[i][j] == "x"
        if (j - column_index) <= column_length
          column_length = (j - column_index)
        end
        return raw_length if raw_length >= column_length
      end
    end
  end
  raw_length += 1
  raw_length >= column_length ? square_size = column_length : square_size = raw_length
  return square_size
end

def build_result_board(board, start_coordinates, end_coordinates)
  i_start = start_coordinates[0]
  j_start = start_coordinates[1]
  i_end = end_coordinates[0]
  j_end = end_coordinates[1]
  (i_start...i_end).each do |i|
    (j_start...j_end).each do |j|
      board[i][j] = "o"
    end
  end
  return board
end

def convert_matrix_into_string(matrix)
  matrix_string = ""
  matrix.each do |row|
    matrix_string << row.join
    matrix_string << "\n"
  end
  return matrix_string
end

#RESOLUTION DISPLAY FUNCTION
def main()
  arguments = arguments_are_valid(ARGV, 1)
  board = put_string_in_a_matrix(file_name_is_valid("feu04_board.txt"))
  squares_array = []
  largest_square, start_coordinates, end_coordinates = 0
  board.each_with_index do |raw, i|
    raw.each_with_index do |element, j|
      if find_a_square(board, i, j) > largest_square
        largest_square = find_a_square(board, i, j)
        start_coordinates = [i, j]
        end_coordinates = [(i + largest_square), (j + largest_square)]
      end
    end
  end
  result_board = build_result_board(board, start_coordinates, end_coordinates)
  puts string_board = convert_matrix_into_string(board)
end

main()
