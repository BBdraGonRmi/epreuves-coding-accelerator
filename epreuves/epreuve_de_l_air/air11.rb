def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def parameters_are_valid(parameters_array)
  for each_parameter in parameters_array
    if each_parameter[1] != nil
      puts "Usage: each parameter must be a single character"
      exit
    end
  end
  return parameters_array
end

def size_is_valid(pyramide_size)
  for each_digit in pyramide_size.chars
    if Integer(each_digit, exception: false) == nil
      puts "Usage: each size character must be a digit"
      exit
    end
  end
  return pyramide_size
end

def build_a_pyramide(parameters)
  tile_shape = parameters[0]
  pyramide_size = Integer(parameters[1])
  for i in 0...pyramide_size
    print " " * (pyramide_size - (i + 1)) + tile_shape * (i + 1) + tile_shape * i
    puts
  end
end

parameters = parameters_are_valid(arguments_are_valid(ARGV, 2))
size_is_valid(parameters[1])
build_a_pyramide(parameters)
