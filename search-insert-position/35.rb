# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
    nums.each.with_index do |num, i|
        return i if num >= target
    end
    nums.size
end
