for i in 0...10
    for j in (i + 1)...10
        if j > i
            for k in (j + 1)...10
                if k >= j
                    print "#{i}#{j}#{k}, "
                end
            end
        end
    end
end
puts