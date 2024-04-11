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
  (0...9).each { |i| return false if sudoku_matrix[i][column_index] == digit }
  (0...9).each { |j| return false if sudoku_matrix[row_index][j] == digit }
  case_row_index = row_index / 3 * 3
  case_column_index = column_index / 3 * 3
  (0...3).each do |k|
    (0...3).each do |l|
      return false if sudoku_matrix[case_row_index + k][case_column_index + l] == digit
    end
  end
  return digit
end

def try_with_all_digits(sudoku_matrix, row_index, column_index)
  (1..9).each do |n|
    result = try_with_digit(sudoku_matrix, row_index, column_index, n)
    #p result
    return sudoku_matrix[row_index][column_index] = result if result
  end
  return false
end

def solve_sudoku(sudoku_matrix)
  every_result_found = true
  sudoku_matrix.each_with_index do |raw, i|
    sudoku_matrix[i].each_with_index do |element, j|
      if sudoku_matrix[i][j] == nil
        every_result_found = false if !try_with_all_digits(sudoku_matrix, i, j)
      end
    end
  end
  solve_sudoku(sudoku_matrix) if !every_result_found
  return sudoku_matrix
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
  solved_sudoku_matrix = solve_sudoku(sudoku_matrix)
  result_string = convert_matrix_into_string(solved_sudoku_matrix)
  puts result_string
end

main()
