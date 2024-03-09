def is_valid(argv)
    if argv.length == 0
        return false
    else
        return true
    end
end

if is_valid(ARGV)
    argv = ARGV
    reversed = []
    for i in 0...argv.length
        reversed[i] = argv[-(i+1)]
    end
    puts reversed
else
    puts "erreur."
end