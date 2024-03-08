def is_valid(argv)
    if argv.length != 3
        return false
    else
        for i in 0...argv.length
            if Integer(argv[i], exception: false) == nil
                return false
            end
        end
        return true
    end
end

if is_valid(ARGV)
    nums = []
    for i in 0...ARGV.length
        nums[i] = Integer(ARGV[i])
    end
    p = 0
    swap = -1
    while swap != 0
        swap = 0
        for i in 0...(nums.length - 1)
            for j in 1...nums.length
                if nums[j] < nums[i]
                    p = nums[j]
                    nums[j] = nums[i]
                    nums[i] = p
                    swap += 1
                end
            end
        end
    end
    puts nums[1]
end