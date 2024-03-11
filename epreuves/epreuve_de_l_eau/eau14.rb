def is_valid(argv)
    if argv.length < 2
        return false
    else
        return true
    end
end

def is_letters(text)
    if text =~ /[^a-zA-Z]/
        return false
    else
        return true
    end
end

def to_lower(c)
    if c =~ /[A-Z]/
        c = c.downcase
        return c
    else
        return c
    end
end

def bubble_sort(array)
    l = 0
    p = 0
    swap = -1
    while swap != 0
        swap = 0
        for i in 0...(array.length - 1)
            l = 0
            while array[i + 1][l] == array[i][l]
                l += 1
            end
            if array[i + 1][l] < array[i][l]
                p = array[i + 1]
                array[i + 1] = array[i]
                array[i] = p
                swap += 1
            end
        end
    end
    return array
end

if is_valid(ARGV)
    array = []
    for i in 0...ARGV.length
        if is_letters(ARGV[i])
            array[i] = ARGV[i]
            array = bubble_sort(array)
        else
            puts "error"
            exit
        end
    end
    for i in 0...array.length
        print "#{array[i]} "
    end
    puts
end
