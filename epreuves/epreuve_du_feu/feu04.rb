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
  raw_length = board.length
  column_length = board[1].length
  (row_index...board.length).each do |i|
    raw_length = (i - row_index + 1)
    p "raw size: #{raw_length}"
    puts
    (column_index...board[i].length).each do |j|
      if raw_length >= column_length
        p "coordinates: #{i}, #{j}"
        p "raw size: #{raw_length}"
        p "column size: #{column_length}"
        square_size = raw_length
        return square_size
      end
      if board[i][j] == "x"
        if (j - column_index) <= column_length
          column_length = (j - column_index)
          p "coordinates: #{i}, #{j}"
          p "column size: #{column_length}"
          puts
        end
      end
    end
  end
  return square_size
end

#RESOLUTION DISPLAY FUNCTION
def main()
  arguments = arguments_are_valid(ARGV, 1)
  board = put_string_in_a_matrix(file_name_is_valid("feu04_board.txt"))
  p square = find_a_square(board, 1, 13)
end

main()
