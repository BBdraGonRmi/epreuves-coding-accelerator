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

def selection_sort(array)
    p1 = 0
    p2 = 0
    min = 0
    while p2 != array.length
        for i in p2...(array.length - 1)
            if array[i + 1] < array[p1]
                p1 = i + 1
            end
        end
        min = array[p1]
        array[p1] = array[p2]
        array[p2] = min
        p2 += 1
        p1 = p2
    end
    return array
end

if is_valid(ARGV)
    if is_num(ARGV)
        array = []
        for i in 0...ARGV.length
            array[i] = Integer(ARGV[i])
        end
        array = selection_sort(array)
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