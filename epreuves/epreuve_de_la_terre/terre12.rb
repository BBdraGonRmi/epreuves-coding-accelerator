def is_valid(argument, number)
  if argument.length != number
      puts "Usage: ruby terre11.rb argument"
      exit
  else
      return argument
  end
end

def is_h12_time_format(time)
  if time.match(/^(0[\d]|1[0-2]):[0-5]\d(A|P)M$/)
    return time.chars
  else
    puts "Usage: the argument should be write in h12 time format (00:00AM)"
    exit
  end
end

def converts_time(time, ascii_time)
  if time[-2] == "A"
    puts "AM"
    if time[0] == "1" && time[1] == "2"
      puts "midnight"
      time[0] = "0"
      time[1] = "0"
    else
      puts "morming"
    end
  else
    puts "PM"
    if time[0] == "1" && time[1] == "2"
      puts "midday"
    elsif time[0] == "0"
      if ascii_time[1] < 56
        puts "afternoon"
        time[0] = "1"
        time[1] = (ascii_time[1] + 2).chr
      else
        puts "time to eat"
        time[0] = "2"
        time[1] = (ascii_time[1] - 8).chr
      end
    else
      puts "evening"
      time[0] = "2"
      time[1] = (ascii_time[1] + 2).chr
    end
  end
  time.pop(2)
  return time.join
end

argument = ARGV
time_array = is_h12_time_format(is_valid(argument, 1)[0])
ascii_time_array = time_array.map { |c| c.ord }

puts converts_time(time_array, ascii_time_array)
