def is_valid(argv)
    if argv.length != 1
        return false
    else
        return true
    end
end

def is_num(num)
    for i in 0...num.length
        if Integer(num[i], exception: false) == nil
            return false
        end
    end
    return true
end 

if is_valid(ARGV)
    puts is_num(ARGV[0])
else
    puts "error"
end
