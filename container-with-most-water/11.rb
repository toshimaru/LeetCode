# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    left, right = 0, height.size - 1
    max = 0
    while left < right
        left_is_greater = height[left] > height[right]
        h = left_is_greater ? height[right] : height[left]
        area = h * (right - left)
        max = area if area > max
        left_is_greater ? right -= 1 : left += 1
    end
    max
end

def max_area1(height)
    left, right = 0, height.size - 1
    max = 0
    while left < right
        area = [height[left], height[right]].min * (right - left)
        max = area if area > max
        height[left] > height[right] ? right -= 1 : left += 1
    end
    max
end

def max_area2(height)
    left, right = 0, height.size - 1
    max = max_h = 0
    while left < right
        left_is_greater = height[left] > height[right]
        h = left_is_greater ? height[right] : height[left]
        if h > max_h
            max_h = h
            area = h * (right - left)
            max = area if area > max
        end
        left_is_greater ? right -= 1 : left += 1
    end
    max
end
