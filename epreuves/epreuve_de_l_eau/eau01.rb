combinations_array = []

for i in 0...100
    for j in (i + 1)...100
        if j > i
            if i < 10
                combination = [0, i].join
            else
                combination = "#{i}"
            end
            if j < 10
                combination << [" ", 0, j].join
            else
                combination << [" ", j].join #"#{j}"
            end
            combinations_array.push(combination)
            combination = ""
        end
    end
end

combinations_string = combinations_array.join(", ")
puts combinations_string
