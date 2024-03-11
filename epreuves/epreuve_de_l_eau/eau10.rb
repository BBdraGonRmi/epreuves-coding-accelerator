def is_valid(argv)
    if argv.length < 2
        return false
    else
        return true
    end
end

if is_valid(ARGV)
    key = ARGV[-1]
    for i in 0...(ARGV.length - 1)
        if ARGV[i] == key
            puts i
            exit
        end
    end
    puts -1
else
    puts "error"
end