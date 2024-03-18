def print_PM(time)
    for i in 0...time.length
        print time[i]
    end
    puts "PM"
end

def print_AM(time)
    for i in 0...time.length
        print time[i]
    end
    puts "AM"
end

time = []
calc = ARGV[0].to_i

for i in 0...ARGV[0].length
    if ARGV[0][i] != ":"
        time[i] = ARGV[0][i].to_i
    else
        time[i] = ARGV[0][i]
    end
end

if calc == 12
    print_PM(time)
elsif calc == 0
    time[0] = 1
    time[1] = 2
    print_AM(time)
elsif calc > 11
    calc -= 12
    if calc < 10
        time[0] = 0
        time[1] = calc
    end
    print_PM(time)
else
    print_AM(time)
end
