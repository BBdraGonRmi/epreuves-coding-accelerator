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

if is_valid(ARGV)
    if is_letter(ARGV[0])
        txt = ARGV[0]
        mod_txt = ""
        p = 0
        if txt[p] =~ /[a-zA-Z]/
            mod_txt[p] = txt[p].upcase
        end
        p += 1
        while txt[p + 1] != nil
            if txt[p] !=~ /[a-zA-Z]/
                if txt[p] == " "
                    mod_txt[p] = txt[p]
                    p += 1
                    if txt[p] =~ /[a-zA-Z]/
                        mod_txt[p] = txt[p].upcase
                        p += 1
                    else
                        mod_txt[p] = txt[p]
                        p += 1
                    end
                else
                    mod_txt[p] = txt[p]
                    p += 1
                end
            else
                mod_txt[p] = txt[p].downcase
                p += 1
            end
        end
        if txt[p] !=~ /[a-zA-Z]/
            mod_txt[p] = txt[p]
        else
            mod_txt[p] = txt[p].downcase
        end
        puts mod_txt
    else
        puts "error"
    end
else
    puts "error"
end 