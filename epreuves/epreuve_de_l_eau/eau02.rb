def is_valid(argument, number)
    if argument.length != number
        return argument
    else
        puts "Usage: ruby eau02.rb argument (this program needs at least one argument to work)"
        exit
    end
end

argument = ARGV
words_array = is_valid(argument, 0)
words_array_reversed = []

for word in words_array.reverse
    words_array_reversed.push(word)
end

puts words_array_reversed
