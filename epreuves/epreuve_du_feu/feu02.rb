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

      p "element: #{shape_to_find_sub_array[element_to_find_index]} found at index: #{i}"

      element_to_find_index += 1

    elsif reference_sub_array[i] == shape_to_find_sub_array[element_to_find_index]

      p "element: #{shape_to_find_sub_array[element_to_find_index]} found at index: #{i}"

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


def find_complete_shape(reference_array, shape_to_find_array, reference_element_starting_index)

  reference_sub_array_starting_index = 0
  matching_sub_array_index = 0
  matching_element_index_array = []
  coordinates = []

  for i in 0...shape_to_find_array.length

    for j in reference_sub_array_starting_index...reference_array.length

      matching_element_index_array[i] = find_sub_array_shape(reference_array[j], shape_to_find_array[i], reference_element_starting_index)

      if matching_element_index_array[i]

        p "sub array: #{shape_to_find_array[i]} found in reference sub array: #{reference_array[j][reference_element_starting_index...]} at index: #{matching_element_index_array[i]}"
        puts

        reference_sub_array_starting_index += 1

        if matching_element_index_array.length > 1
          if matching_element_index_array[i] != matching_element_index_array[i - 1]
            return false
          end
        end

        break
      else
        p "sub array: #{shape_to_find_array[i]} NOT found in reference sub array: #{reference_array[j]}"
        puts

        reference_sub_array_starting_index += 1
        matching_sub_array_index += 1
      end
    end
  end

  coordinates = [matching_element_index_array[0], matching_sub_array_index]
  return coordinates
end


arguments = arguments_are_valid(ARGV, 2)

board_file_data = read_file(file_name_is_valid(arguments[0]))
to_find_file_data = read_file(file_name_is_valid(arguments[1]))

p reference_array = put_file_in_an_array(board_file_data)
p shape_to_find_array = put_file_in_an_array(to_find_file_data)
puts

reference_element_starting_index = 0

for i in reference_element_starting_index..(reference_array[0].length - shape_to_find_array[0].length)

  coordinates = find_complete_shape(reference_array, shape_to_find_array, i)

end

if coordinates
  puts "shape found at coordinates: #{coordinates}"
else
  puts "shape not found"
end






#p find_shape(reference_array[2], shape_to_find_array[1])

#x_coordinates = 0
#y_coordinates = 0

#board_file_data = read_file(file_name_is_valid(arguments[0]))
#to_find_file_data = read_file(file_name_is_valid(arguments[1]))

#for i in 0...board_file_data.length

  #if board_file_data[i] =~ /\n/
    #p "found at #{i}"
  #end
#end

#for x_coordinates in 0...
