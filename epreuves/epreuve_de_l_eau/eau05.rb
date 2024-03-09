def is_valid(argv)
    if argv.length != 2 || Integer(argv[0], exception: false) != nil || Integer(argv[1], exception: false) != nil
        return false
    else
        return true
    end
end

def s_in_s(long, short)
    for i in 0...long.length
        if short[0] == long[i] && Integer(long[i], exception: false) != nil
            for j in 0...short.length
                puts short[j]
                puts long[i]
                if short[j] != long[i] && Integer(long[i], exception: false) != nil
                    return false
                end
                i += 1
            end
            return true
        end
    end
    return false
end

if is_valid(ARGV)
    if ARGV[0].length > ARGV[1].length
        long = ARGV[0]
        short = ARGV[1]
    else
        long = ARGV[1]
        short = ARGV[0]
    end
    if s_in_s(long, short)
        puts true
    else
        puts false
    end
else
    puts "error"
end
