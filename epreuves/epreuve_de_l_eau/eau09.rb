def is_valid(argv)
    if argv.length != 2
        return false
    else
        return true
    end
end

def is_num(num)
    if Integer(num, exception: false) == nil
        return false
    end
    return true
end 

if is_valid(ARGV)
    if is_num(ARGV[0]) && is_num(ARGV[1])
        argv_0 = Integer(ARGV[0])
        argv_1 = Integer(ARGV[1])
        if argv_0 < argv_1
            low = argv_0
            high = argv_1
        else
            low = argv_1
            high = argv_0
        end
        for i in low...high
            print "#{i} "
        end
        puts
    else
        puts "error"
    end
else
    puts "error"
end