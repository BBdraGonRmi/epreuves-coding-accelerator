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
def read_file(file)
  file_data = file.read
  return file_data
end

def put_file_in_an_array(file)

  file_array = []
  file_sub_array = []
  array_index = 0

  for each_character in file.chars

    if each_character =~ /\r/
      next

    elsif each_character =~ /\n/
      array_index += 1
      file_sub_array
      file_array << file_sub_array
      file_sub_array = []
      next

    elsif each_character =~ /\s/
      each_character = nil
    end

    file_sub_array << each_character
  end

  file_array << file_sub_array
  return file_array
end


def find_sub_array_shape(reference_sub_array, shape_to_find_sub_array, *rest)

  element_to_find_index = 0

  if rest[0] == nil
    starting_index = 0
    matching_element_index = 0
  else
    starting_index = rest[0]
    matching_element_index = rest[0]
  end

  for i in starting_index...reference_sub_array.length

    if shape_to_find_sub_array[element_to_find_index] == nil
      element_to_find_index += 1

    elsif reference_sub_array[i] == shape_to_find_sub_array[element_to_find_index]
      element_to_find_index += 1

    else
      matching_element_index += 1
    end

    if element_to_find_index >= shape_to_find_sub_array.length
      return matching_element_index
    end
  end

  return false
end


def find_shape_at_given_index(reference_array, shape_to_find_array, reference_element_starting_index)

  reference_sub_array_starting_index = 0
  matching_sub_array_index = 0
  matching_element_index_array = []
  coordinates = []

  for i in 0...shape_to_find_array.length

    for j in reference_sub_array_starting_index...reference_array.length
      matching_element_index_array[i] = find_sub_array_shape(reference_array[j], shape_to_find_array[i], reference_element_starting_index)

      if matching_element_index_array[i]
        reference_sub_array_starting_index += 1

        if matching_element_index_array.length > 1

          if matching_element_index_array[i] != matching_element_index_array[i - 1]
            return false
          end
        end
        break

      else
        if matching_element_index_array[0]
          return false
        end

        reference_sub_array_starting_index += 1
        matching_sub_array_index += 1
      end
    end
  end

  if matching_element_index_array[0]
    coordinates = [matching_element_index_array[0], matching_sub_array_index]
    return coordinates

  else
    return false
  end
end

def find_shape(reference_array, shape_to_find_array)

  reference_element_starting_index = 0

  for i in reference_element_starting_index..(reference_array[0].length - shape_to_find_array[0].length)

    coordinates = find_shape_at_given_index(reference_array, shape_to_find_array, i)

    if coordinates
      coordinates_string = coordinates.join(", ")
      return coordinates_string
    end
  end

  return false
end

def build_result_array(reference_array, shape_to_find_array, coordinates_string)

  if coordinates_string == false
    return false
  end

  result_array = []

  for i in 0...reference_array.length
    result_array << []
    for j in 0...reference_array[0].length
      result_array[i] << "-"
    end
  end

  x_coordinates = Integer(coordinates_string[0])
  y_coordinates = Integer(coordinates_string[-1])
  shape_to_find_array_index = 0
  shape_to_find_sub_array_index = 0

  for i in 0...reference_array.length

    if i == y_coordinates

      for j in 0...reference_array[0].length

        if j == x_coordinates

          if shape_to_find_array[shape_to_find_array_index][shape_to_find_sub_array_index] != nil
            result_array[i][j] = shape_to_find_array[shape_to_find_array_index][shape_to_find_sub_array_index]
          end

          if shape_to_find_sub_array_index < (shape_to_find_array[0].length - 1)
            x_coordinates += 1
            shape_to_find_sub_array_index += 1
          end
        end
      end

      x_coordinates = Integer(coordinates_string[0])
      shape_to_find_sub_array_index = 0

      if shape_to_find_array_index < (shape_to_find_array.length - 1)
        y_coordinates += 1
        shape_to_find_array_index += 1
      end
    end
  end

  return result_array
end

def convert_two_dimensions_array_into_string(two_dimensions_array)

  if two_dimensions_array == false
    return false
  end

  result_string = ""

  for i in 0...two_dimensions_array.length

    result_string << two_dimensions_array[i].join
    result_string << "\n"
  end

  return result_string
end

#DISPLAY FUNCTION
def display_result(coordinates_string, reference_array, shape_to_find_array, result_string)

  if coordinates_string
    puts "Found!"
    puts "Coordinates: #{coordinates_string}"
    puts result_string

  else
    puts "Unfindable!"
  end
end


#RESOLUTION DISPLAY FUNCTION
def main()

  arguments = arguments_are_valid(ARGV, 2)

  board_file_data = read_file(file_name_is_valid(arguments[0]))
  to_find_file_data = read_file(file_name_is_valid(arguments[1]))

  reference_array = put_file_in_an_array(board_file_data)
  shape_to_find_array = put_file_in_an_array(to_find_file_data)

  coordinates_string = find_shape(reference_array, shape_to_find_array)
  result_array = build_result_array(reference_array, shape_to_find_array, coordinates_string)
  result_string = convert_two_dimensions_array_into_string(result_array)

  display_result(coordinates_string, reference_array, shape_to_find_array, result_string)
end

main()
