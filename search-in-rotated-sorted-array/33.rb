# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    l, h = 0, nums.size - 1
    while l < h
        m = (l + h) / 2
        return m if nums[m] == target

        if nums[l] <= nums[m]
            if target >= nums[l] && target < nums[m]
                h = m - 1
            else
                l = m + 1
            end
        else
            if target > nums[m] && target <= nums[h]
                l = m + 1
            else
                h = m - 1
            end
        end
    end
    nums[l] == target ? l : -1
end

def search2(nums, target)
    l, h = 0, nums.size
    while l < h
        m = (l + h) / 2
        num = if nums[0] > nums[m] == target < nums[0]
            nums[m]
        else
            target < nums[0] ? -1 : Float::INFINITY
        end

        if num < target
            l = m + 1
        elsif num > target
            h = m
        else
            return m
        end
    end
    -1
end

puts search([4,5,6,7,0,1,2], 0)
puts search([4,5,6,7,0,1,2], 3)
puts search([1], 0)
puts search([1, 3], 0)
puts search([1], 1)
puts search([1, 3], 3)
puts search([1, 3, 5], 1)
puts search([1, 3, 5], 5)
puts search([4,5,6,7,0,1,2], 6)
puts search([1,2,3,4,5,6], 4)
puts
puts search2([4,5,6,7,0,1,2], 0)
puts search2([4,5,6,7,0,1,2], 3)
puts search2([1], 0)
puts search2([1, 3], 0)
puts search2([1], 1)
puts search2([1, 3], 3)
puts search2([1, 3, 5], 1)
puts search2([1, 3, 5], 5)
puts search2([4,5,6,7,0,1,2], 6)
puts search2([1,2,3,4,5,6], 4)
