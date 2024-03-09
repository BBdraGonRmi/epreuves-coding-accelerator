def is_valid(argv)
    if argv.length != 1
        return false
    else
        return true
    end
end

def is_letter(text)
    for i in 0...text.length
        if Integer(text[i], exception: false) != nil
            return false
        end
    end
    return true
end 

def to_upper(c)
    if c !=~ /[\W]/
        c = c.upcase
        return c
    else
        return false
    end
end

def to_lower(c)
    if c !=~ /[\W]/
        c = c.downcase
        return c
    else
        return false
    end
end

if is_valid(ARGV)
    if is_letter(ARGV[0])
        text = ARGV[0]
        mod_txt = ""
        p = 0
        while text[p + 1] != nil
            if to_upper(text[p])
                mod_txt[p] = to_upper(text[p])
                p += 1
                if to_lower(text[p])
                    mod_txt[p] = to_lower(text[p])
                    p += 1
                else
                    mod_txt[p] = text[p]
                    p += 1
                end
            else
                mod_txt[p] = text[p]
                p += 1
            end
        end
        if text[p] != nil
            mod_txt[p] = to_upper(text[p])
        end
        puts mod_txt
    else
        puts "error"
    end
else
    puts "error"
end 