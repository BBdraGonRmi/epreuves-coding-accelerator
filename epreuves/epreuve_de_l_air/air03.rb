def arguments_are_present(arguments)
  if arguments.length == 0
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end


def find_the_intruder(arguments)
  match_counter = 0
  for each_argument in arguments
    for each_other_argument in arguments
      if each_argument == each_other_argument
        match_counter += 1
      end
    end
    if match_counter == 1
      return each_argument
    else
      match_counter = 0
    end
  end
end


intruder = find_the_intruder(arguments_are_present(ARGV))
puts intruder
