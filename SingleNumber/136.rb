def single_number1(nums)
    answer = []
    nums.each do |i|
        if answer.include?(i)
            answer.delete(i)
        else
            answer << i
        end
    end
    answer.first
end

def single_number(nums)
    nums.inject(:^)
end

p single_number([2,2,1])
