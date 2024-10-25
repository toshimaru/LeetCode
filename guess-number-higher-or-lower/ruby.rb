def guessNumber(n)
    left, right = 1, n
    while left <= right
        mid = (left + right) / 2
        case guess(mid)
        when -1 then right = mid - 1
        when  1 then left  = mid + 1
        else return mid
        end
    end
end
