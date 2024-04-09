#ERROR HANDLING FUNCTIONS
def arguments_are_valid(arguments, arguments_number)

  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit

  else
      return arguments
  end
end

def tile_shape_is_valid(tile_shape)

  if tile_shape[1] != nil
    puts "Error: tile shape parameter must be a single character"
    exit
  end

  return tile_shape
end

def size_is_valid(pyramide_size)

  for each_digit in pyramide_size.chars

    if Integer(each_digit, exception: false) == nil
      puts "Error: each character of size parameter must be a digit"
      exit
    end
  end

  return pyramide_size
end


#UTILITY FUNCTIONS
def build_a_pyramide(parameters, tile_shape, pyramide_size)

  for i in 0...pyramide_size
    print " " * (pyramide_size - (i + 1)) + tile_shape * (i + 1) + tile_shape * i
    puts
  end
end


#RESOLUTION & DISPLAY FUNCTION
def main()

  parameters = arguments_are_valid(ARGV, 2)
  pyramide_size = Integer(size_is_valid(parameters[1]))
  tile_shape = tile_shape_is_valid(parameters[0])

  build_a_pyramide(parameters, tile_shape, pyramide_size)
end

main()
