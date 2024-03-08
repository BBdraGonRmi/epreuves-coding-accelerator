def is_valid(argv)
    if argv.length != 1
        return false
    else
        return true
    end
end

def inversion(sentence)
    sentence_reversed = ""
    for i in 0...sentence.length
        sentence_reversed[i] = sentence[-(i+1)]
    end
    return sentence_reversed
end 

if is_valid(ARGV)
    sentence = inversion(ARGV[0])
    puts sentence
else
    puts "erreur."
end