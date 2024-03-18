def is_valid(argument, number)
    if argument.length != number
        puts "Usage: ruby terre11.rb argument"
        exit
    else
        return argument
    end
  end

def is_string(word)
    for character in word.chars
        if Integer(character, exception: false) == nil
            return word
        else
            puts "Usage: arguments must be strings"
            exit
        end
    end
end

def sorts_strings(first_string, second_string)
    if first_string.length > second_string.length
        long_string = first_string
        short_string = second_string
    else
        long_string = second_string
        short_string = first_string
    end
    return long_string, short_string
end

def string_is_in_string(long_string, short_string)
    for character in long_string.chars
        if short_string[0] == long_string[character]
            for character in short_string.chars
                if short_string[character] != long_string[character]
                    return false
                end
            end
            return true
        end
    end
    return false
end

argument = is_valid(ARGV, 2)
first_string = is_string(argument[0])
second_string = is_string(argument[1])
sorted_strings = sorts_strings(first_string, second_string)

puts string_is_in_string(sorted_strings[0], sorted_strings[1])
