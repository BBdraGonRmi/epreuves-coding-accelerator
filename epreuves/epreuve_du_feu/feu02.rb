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
def put_file_in_a_matrix(file, nil_character)
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
    character = nil if character =~ nil_character
    matrix_line << character
  end
  full_matrix << matrix_line
  return full_matrix
end

def find_rows_match(reference_row, row_to_find, *rest)
  element_to_find_index = 0
  rest[0] == nil ? starting_index = 0 : starting_index = rest[0]
  first_matching_element_index = starting_index
  (starting_index...reference_row.length).each do |i|
    if row_to_find[element_to_find_index] == nil
      element_to_find_index += 1
    elsif row_to_find[element_to_find_index] == reference_row[i]
      element_to_find_index += 1
    else
      first_matching_element_index += 1
    end
    return first_matching_element_index if element_to_find_index >= row_to_find.length
  end
  return false
end

def find_matrices_match_at_given_index(reference_matrix, matrix_to_find, element_starting_index)
  row_starting_index = 0
  matching_rows_index = 0
  matching_elements_index_array = []
  matrix_to_find.each_with_index do |row_to_find, i|
    (row_starting_index...reference_matrix.length).each do |j|
      matching_elements_index_array[i] = find_rows_match(reference_matrix[j], row_to_find, element_starting_index)
      row_starting_index += 1
      if matching_elements_index_array.length > 1
        return false if matching_elements_index_array[i] != matching_elements_index_array[i - 1]
      end
      break if matching_elements_index_array[i]
      return false if matching_elements_index_array[0]
      matching_rows_index += 1
    end
  end
  coordinates = [matching_elements_index_array[0], matching_rows_index]
  return coordinates
end

def find_matrices_match(reference_matrix, matrix_to_find)
  (0..(reference_matrix[0].length - matrix_to_find[0].length)).each do |i|
    coordinates = find_matrices_match_at_given_index(reference_matrix, matrix_to_find, i)
    return coordinates.join(", ") if coordinates
  end
  return false
end

def build_result_matrix(reference_matrix, matrix_to_find, coordinates_string)
  result_matrix = []
  (0...reference_matrix.length).each do |i|
    result_matrix << []
    (0...reference_matrix[0].length).each { |j| result_matrix[i] << "-" }
  end
  column_index = Integer(coordinates_string[0])
  row_index = Integer(coordinates_string[-1])
  matrix_to_find_index = 0
  matrix_to_find_row_index = 0
  (0...reference_matrix.length).each do |i|
    if i == row_index
      (0...reference_matrix[0].length).each do |j|
        if j == column_index
          if matrix_to_find[matrix_to_find_index][matrix_to_find_row_index]
            result_matrix[i][j] = matrix_to_find[matrix_to_find_index][matrix_to_find_row_index]
          end
          if matrix_to_find_row_index < (matrix_to_find[0].length - 1)
            column_index += 1
            matrix_to_find_row_index += 1
          end
        end
      end
      column_index = Integer(coordinates_string[0])
      matrix_to_find_row_index = 0
      if matrix_to_find_index < (matrix_to_find.length - 1)
        row_index += 1
        matrix_to_find_index += 1
      end
    end
  end
  return result_matrix
end

def convert_matrix_into_string(matrix)
  matrix_string = ""
  matrix.each do |row|
    matrix_string << row.join
    matrix_string << "\n"
  end
  return matrix_string
end

#DISPLAY FUNCTION
def display_result(coordinates_string, matrix_string)
  if coordinates_string
    puts "Found!"
    puts "Coordinates: #{coordinates_string}"
    puts matrix_string
  else
    puts "Unfindable!"
  end
end


#RESOLUTION DISPLAY FUNCTION
def main()
  arguments = arguments_are_valid(ARGV, 2)
  board_file_data = file_name_is_valid(arguments[0]).read
  to_find_file_data = file_name_is_valid(arguments[1]).read
  reference_matrix = put_file_in_a_matrix(board_file_data, /\s/)
  matrix_to_find = put_file_in_a_matrix(to_find_file_data, /\s/)
  coordinates_string = find_matrices_match(reference_matrix, matrix_to_find)
  if coordinates_string
    result_matrix = build_result_matrix(reference_matrix, matrix_to_find, coordinates_string)
    matrix_string = convert_matrix_into_string(result_matrix)
  end
  display_result(coordinates_string, matrix_string)
end

main()
