def is_valid(argv)
    if argv.length != 2
        return false
    end
    num = Integer(argv[0], exception: false)
    den = Integer(argv[1], exception: false)
    if num > den && den > 0
        return [num, den]
    else
        return false
    end
end

if is_valid(ARGV)
    num = is_valid(ARGV)[0]
    den = is_valid(ARGV)[1]
    result = num / den
    rest = num % den
    puts "résultat: #{result}"
    puts "reste: #{rest}"
else
    puts "erreur."
end