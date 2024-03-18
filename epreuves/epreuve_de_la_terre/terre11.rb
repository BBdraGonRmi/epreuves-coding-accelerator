def is_valid(argument, number)
  if argument.length != number
      puts "Usage: ruby terre11.rb argument"
      exit
  else
      return argument
  end
end

def is_h24_time_format(time)
  if time.match(/^([01]\d|2[0-4]):[0-5]\d$/)
    return time.chars
  else
    puts "Usage: the argument should be write in h24 time format"
    exit
  end
end

def converts_time(time, ascii_time)
  if time[0] == "1" && time[1] == "2"
    return time.join + "PM"
  elsif time[0] == "0" && time[1] == "0"
    time[0] = "1"
    time[1] = "2"
    return time.join + "AM"
  elsif ascii_time[0] > 48 && ascii_time[1] > 50
    time[0] = (ascii_time[0] - 1).chr
    time[1] = (ascii_time[1] - 2).chr
    return time.join + "PM"
  else
    return time.join + "AM"
  end
end

argument = ARGV
time_array = is_h24_time_format(is_valid(argument, 1)[0])
ascii_time_array = time_array.map { |c| c.ord }

puts converts_time(time_array, ascii_time_array)
