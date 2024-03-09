def is_valid(argv)
    if argv.length != 1 || Integer(argv[0], exception: false) == nil || Integer(argv[0], exception: false) < 0
        return false
    else
        return true
    end
end

if is_valid(ARGV)
    num = Integer(ARGV[0])
    if num <= 1
        puts num
    else
        f = 0
        f_1 = 1
        f_2 = 0
        for i in 1...num
            f = f_1 + f_2
            f_2 = f_1
            f_1 = f
        end
        puts f
    end
else
    puts "-1"
end