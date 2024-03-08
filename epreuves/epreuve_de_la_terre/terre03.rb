letter = ARGV[0]
ab = "abcdefghijklmnopqrstuvwxyz"

for i in 0...ab.length
    if ab[i] == letter
        while i != ab.length
            print ab[i]
            i += 1
        end
    end
end

puts