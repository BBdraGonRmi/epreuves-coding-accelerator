for i in 0...100
    for j in (i + 1)...100
        if j > i
            if i < 10
                print "0#{i} "
            else
                print "#{i} "
            end
            if j < 10
                print "0#{j},"
            else
                print "#{j},"
            end
        end
    end
end
puts