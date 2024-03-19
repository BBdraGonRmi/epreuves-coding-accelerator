def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end

def find_the_intruder(arguments) # Not working for every case
  intruder = true
  comparing_arguments_index_start = 1
  for each_argument in arguments
    intruder = true
    for i in comparing_arguments_index_start..arguments.length
      if each_argument == arguments[i]
        puts each_argument
        puts arguments[i]
        puts i
        intruder = false
      end
    end
    comparing_arguments_index_start += 1
    if intruder == true
      return each_argument
    end
  end
end

def find_the_intruder(arguments) # Working for every case, but not well-coded
  comparing_arguments_index = 1
  compared_argument = arguments[0]
  for i in 0..arguments.length
    compared_argument = arguments[0]
    if compared_argument == arguments[comparing_arguments_index]
      arguments.delete_at(comparing_arguments_index)
      arguments.delete(compared_argument)
      comparing_arguments_index = 1
    else
      comparing_arguments_index += 1
    end
  end
  return compared_argument
end

puts find_the_intruder(arguments_are_present(ARGV))
