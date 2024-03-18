combinations_array = []

for i in 0...10
    for j in (i + 1)...10
        if j > i
            for k in (j + 1)...10
                if k >= j
                    combination = [i, j, k].join
                    combinations_array.push(combination)
                end
            end
        end
    end
end

combinations_string = combinations_array.join(", ")
puts combinations_string
