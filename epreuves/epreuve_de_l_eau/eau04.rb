def is_valid(argv)
    if argv.length != 1 || Integer(argv[0], exception: false) == nil || Integer(argv[0], exception: false) < 0
        return false
    else
        return true
    end
end

def premier(num)
    if num < 2
        return false
    else
        for i in 2...num
            if num % i == 0 || i > num
                return false
            end
        end
    end
    return true
end


if is_valid(ARGV)
    num = Integer(ARGV[0])
    while premier(num) == false
        num += 1
    end
    puts num
else
    puts "-1"
end