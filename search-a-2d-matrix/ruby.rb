# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    matrix.each do |row|
        left, right = 0, row.size - 1
        next if target > row[right]

        while left <= right
            mid = (left + right) / 2
            num = row[mid]
            if target > num
                left = mid + 1
            elsif target < num
                right = mid - 1
            else
                return true
            end
        end
    end
    false
end
