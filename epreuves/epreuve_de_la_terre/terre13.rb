def is_valid(argv)
    for i in 0...argv.length
        if Integer(argv[i], exception: false) == nil
            return false
        end
    end
    return true
end

def is_sort(nums)
    p = 0
    for i in 0...(nums.length - 1)
        if nums[i + 1] < nums[i]
            return false
        end
    end
    return true
    end

if is_valid(ARGV)
    nums = []
    for i in 0...ARGV.length
        nums[i] = Integer(ARGV[i])
    end
    if is_sort(nums)
        puts "Triée!"
    else
        puts "Pas triée!"
    end
else
    puts "erreur."
end