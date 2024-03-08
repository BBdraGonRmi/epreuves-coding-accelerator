def is_valid(argv)
    if argv.length != 1
        return false
    else
        return true
    end
end

def taille(sentence)
    p = 0
    while sentence[p] != nil
        if Integer(sentence[p], exception: false) != nil
            return false
        end
        p += 1
    end
    return p
end 

if is_valid(ARGV)
    taille = taille(ARGV[0])
    if taille == false
        puts "erreur."
    else
        puts taille
    end
else
    puts "erreur."
end