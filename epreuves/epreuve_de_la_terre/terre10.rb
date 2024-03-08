def is_valid(argv)
    if argv.length != 1 || Integer(argv[0], exception: false) == nil || Integer(argv[0], exception: false) < 0
        return false
    else
        return true
    end
end

def premier(num)
    for i in 2...num
        if num % i == 0 || i > num
            return false
        end
    end
    if num < 2
        return false
    end
    return true
end


if is_valid(ARGV)
    num = Integer(ARGV[0])
    if premier(num) == true
        puts "Oui, #{num} est un nombre premier"
    else
        puts "Non, #{num} n'est pas un nombre premier"
    end
else
    puts "erreur."
end