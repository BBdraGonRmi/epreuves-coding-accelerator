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

if is_valid(ARGV)
    if is_num(ARGV)
        gap = (Integer(ARGV[0]).abs - Integer(ARGV[1]).abs).abs
        start = 1
        for i in 0...(ARGV.length - 1)
            for j in start...ARGV.length
                gap_i = (Integer(ARGV[i]).abs - Integer(ARGV[j]).abs).abs
                if gap_i < gap
                    gap = gap_i
                end
            end
            start += 1
        end
        puts gap
    else
        puts "error"
    end
else
    puts "error"
end