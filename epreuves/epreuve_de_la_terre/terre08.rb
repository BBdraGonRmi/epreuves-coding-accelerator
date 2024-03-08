def is_valid(argv)
    if argv.length != 2
        return false
    end
    num = Integer(argv[0], exception: false)
    exp = Integer(argv[1], exception: false)
    if exp >= 0
        return [num, exp]
    else
        return false
    end
end

if is_valid(ARGV)
    num = is_valid(ARGV)[0]
    exp = is_valid(ARGV)[1]
    result = num ** exp
    puts "résultat: #{result}"
else
    puts "erreur."
end