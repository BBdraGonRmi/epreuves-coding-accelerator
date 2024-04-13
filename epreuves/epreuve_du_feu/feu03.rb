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

def try_with_all_digits(result_matrix, row_index, column_index, *rest)
  rest[0] ? starting_digit = (rest[0] + 1) : starting_digit = 1
  (starting_digit..9).each do |n|
    digit = try_with_digit(result_matrix, row_index, column_index, n)
    return digit if digit
  end
  return false
end

def solve_sudoku(sudoku_matrix, result_matrix, *rest)
  rest[0]
  if rest[0]
    rest[0][-1]
    last_digit_tried =  rest[0][-1][:digit]

    rest[0].pop
    every_digits_tried = rest[0]
  else
    last_digit_tried = nil
    every_digits_tried = []
  end
  last_digit_tried
  every_result_found = true
  at_least_one_result_found = false
  result_matrix.each_with_index do |raw, i|
    result_matrix[i].each_with_index do |element, j|
      digits_tried = []
      if result_matrix[i][j] == nil
        digit = try_with_all_digits(result_matrix, i, j)
        if digit && digit != last_digit_tried
          digit_tried = {
            digit: digit,
            i: i,
            j: j
          }
          every_digits_tried << digit_tried
          result_matrix[i][j] = digit
          at_least_one_result_found = false
        else
          every_result_found = false
          break if last_digit_tried
        end

        #last_digit_tried = nil if digit == last_digit_tried
      end
    end
    break if last_digit_tried
  end

  p "every digits tried: #{every_digits_tried[-1]}"
  #p sudoku_matrix
  #puts
  p "result matrix: #{result_matrix}"
  puts

  if !every_result_found
    #p every_digits_tried[-1]
    p "not every result found"
    result_matrix[every_digits_tried[-1][:i]][every_digits_tried[-1][:j]] = nil
    #result_matrix[every_digits_tried[-2][:i]][every_digits_tried[-2][:j]] = nil
    #every_digits_tried.pop
    solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  end

  p "every digits tried - 1: #{every_digits_tried[-1]}"
  #p sudoku_matrix
  #puts
  p "result matrix - 1: #{result_matrix}"
  puts



  return result_matrix, every_digits_tried
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
  result_matrix = put_file_in_a_digital_matrix(sudoku_file_data, /\./)
  solved_sudoku_matrix, every_digits_tried = solve_sudoku(sudoku_matrix, result_matrix)
  #solved_sudoku_matrix[-1][-1] = nil

  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)
  #solved_sudoku_matrix, every_digits_tried = solve_sudoku(result_matrix, result_matrix, every_digits_tried)

  result_string = convert_matrix_into_string(solved_sudoku_matrix)
  #puts result_string
end

main()

def ssolve_sudoku(sudoku_matrix, result_matrix, every_digits_tried)
  every_result_found = true
  at_least_one_result_found = false
  result_matrix.each_with_index do |raw, i|
    result_matrix[i].each_with_index do |element, j|
      digits_tried = []
      if result_matrix[i][j] == nil
        digits_tried = try_with_all_digits(result_matrix, i, j, every_digits_tried)
        every_digits_tried << digits_tried
        if digits_tried[-1]
          result_matrix[i][j] = digits_tried[-1]
          at_least_one_result_found = false
        else
          every_result_found = false
        end
      end
    end
  end
  p "every digits tried: #{every_digits_tried}"
  puts
  #p sudoku_matrix
  #puts
  p "result matrix: #{result_matrix}"
  puts
  #solve_sudoku(result_matrix, result_matrix,every_digits_tried[-1]) if !every_result_found
  return result_matrix, every_digits_tried
end
