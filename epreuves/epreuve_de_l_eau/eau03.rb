def is_valid(argument, number)
    if argument.length != number
        puts "Usage: ruby terre11.rb argument"
        exit
    else
        return argument
    end
  end

def is_number(number)
    if Integer(number, exception: false) == nil
        puts "Usage: the argument must be a number"
        exit
    elsif Integer(number, exception: false) < 0
        puts "-1"
        exit
    else
        return Integer(number)
    end
end

argument = ARGV
index = is_number(is_valid(argument, 1)[0])
fibonacci_sequence = [0, 1]

for i in 2...index + 1
    fibonacci_sequence[i] = fibonacci_sequence[i - 2] + fibonacci_sequence[i - 1]
end

puts fibonacci_sequence[index]
