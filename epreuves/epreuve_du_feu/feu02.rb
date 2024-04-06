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
      file_array << file_sub_array
      file_sub_array = []
      next

    elsif each_character =~ /\s/
      each_character = nil
    end

    file_sub_array << each_character
  end

  return file_array
end


def find_shape(reference_array, shape_to_find_array, *rest)

  result_array = []
  element_to_find_index = 0


  if rest[0] == nil
    starting_index = 0
    matching_index = 0
  else
    starting_index = rest[0]
    matching_index = rest[0]
  end
  #p "array to match: #{shape_to_find_array}"
  #puts

  for i in starting_index...reference_array.length

    #p "searching in array for element: #{each_element}"
    #p "element to find: #{shape_to_find_array[element_to_find_index]}"
    #puts

    if shape_to_find_array[element_to_find_index] == nil
      element_to_find_index += 1
    elsif reference_array[i] == shape_to_find_array[element_to_find_index]
      element_to_find_index += 1
    else
      matching_index += 1
    end

    if element_to_find_index >= shape_to_find_array.length
      return matching_index
    end
  end

  return false
end


arguments = arguments_are_valid(ARGV, 2)

board_file_data = read_file(file_name_is_valid(arguments[0]))#.delete("\r")
to_find_file_data = read_file(file_name_is_valid(arguments[1]))#.delete("\r")

reference_array = put_file_in_an_array(board_file_data)
shape_to_find_array = put_file_in_an_array(to_find_file_data)

find_array = []

for i in 0...shape_to_find_array.length

  for j in 0...reference_array.length

    if find_shape(reference_array[j], shape_to_find_array[i]) != false

      x_coordinates = find_shape(reference_array[j], shape_to_find_array[i])
      y_coordinates = j


      matching_index = find_shape(reference_array[y_coordinates + 1], shape_to_find_array[x_coordinates + 1])

      if x_coordinates == matching_index
        p "found"
      else
        p x_coordinates = find_shape(reference_array[y_coordinates], shape_to_find_array[i], matching_index)

        if x_coordinates == matching_index
        p "finally found"
        end
      end
      exit
    end
  end
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
