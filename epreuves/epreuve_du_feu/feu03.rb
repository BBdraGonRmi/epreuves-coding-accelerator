# CONSTANTS
GRID_SIZE = 9
BOX_SIZE = 3

#ERROR HANDLING FUNCTIONS
def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
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
def put_file_in_a_digital_matrix(file, nil_character)
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
    character =~ nil_character ? matrix_line << nil : matrix_line << Integer(character)
  end
  full_matrix << matrix_line
  return full_matrix
end

def try_with_digit(sudoku_matrix, row_index, column_index, digit)
  (0...GRID_SIZE).each { |i| return false if sudoku_matrix[i][column_index] == digit }
  (0...GRID_SIZE).each { |j| return false if sudoku_matrix[row_index][j] == digit }
  box_row_index = row_index / BOX_SIZE * BOX_SIZE
  box_column_index = column_index / BOX_SIZE * BOX_SIZE
  (0...BOX_SIZE).each do |k|
    (0...BOX_SIZE).each do |l|
      return false if sudoku_matrix[box_row_index + k][box_column_index + l] == digit
    end
  end
  return true
end

def solve_sudoku(sudoku_matrix)
  (0...GRID_SIZE).each do |i|
    (0...GRID_SIZE).each do |j|
      if sudoku_matrix[i][j] == nil
        (1..GRID_SIZE).each do |digit|
          if try_with_digit(sudoku_matrix, i, j, digit)
            sudoku_matrix[i][j] = digit
            if solve_sudoku(sudoku_matrix)
              return true
            else
              sudoku_matrix[i][j] = nil
            end
          end
        end
        return false
      end
    end
  end
  return true
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
  sudoku_file_data = file_name_is_valid(arguments[0]).read
  sudoku_matrix = put_file_in_a_digital_matrix(sudoku_file_data, /\./)
  sudoku_file_data.close
  if solve_sudoku(sudoku_matrix)
    result_string = convert_matrix_into_string(sudoku_matrix)
    puts result_string
  else
    puts "Sudoku unsolvable"
  end
end

main()
