def is_valid(argv)
    if argv.length < 2
        return false
    else
        return true
    end
end

def is_num(argv)
    for i in 0...argv.length
        if Integer(argv[i], exception: false) == nil
            return false
        end
    end
    return true
end

def bubble_sort(array)
    p = 0
    swap = -1
    while swap != 0
        swap = 0
        for i in 0...(array.length - 1)
            if array[i + 1] < array[i]
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
    if is_num(ARGV)
        array = []
        for i in 0...ARGV.length
            array[i] = Integer(ARGV[i])
        end
        array = bubble_sort(array)
        for i in 0...array.length
            print "#{array[i]} "
        end
        puts
    else
        puts "error"
    end
else
    puts "error"
end