def is_valid(argv)
    if argv.length != 1 || Integer(argv[0], exception: false) == nil
        return false
    else
        return true
    end
end

def is_pair(num)
    if num % 2 == 0
        return true
    else
        return false
    end
end


if is_valid(ARGV)
    num = Integer(ARGV[0])
    if is_pair(num)
        puts "pair"
    else
        puts "impair"
    end
else
    puts "Tu ne me l'a mettras pas à l'envers."
end