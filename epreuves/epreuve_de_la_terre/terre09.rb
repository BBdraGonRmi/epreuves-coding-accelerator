def is_valid(argv)
    if argv.length != 1 || Integer(argv[0], exception: false) == nil || Integer(argv[0], exception: false) < 0
        return false
    else
        return true
    end
end

def carre(num)
    for i in 0...(num + 1)
        if i * i == num
            return i
        end
    end
    return false
end


if is_valid(ARGV)
    num = Integer(ARGV[0])
    if carre(num) != false
        carre = carre(num)
        puts carre
    else
        puts "erreur."
    end
else
    puts "erreur."
end