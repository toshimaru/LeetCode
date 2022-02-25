# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    ary = (nums1+nums2).sort
    size = ary.size
    if size.odd?
        ary[size/2]
    else
        ary = ary[(size/2-1)..size/2]
        ary.sum / ary.size.to_f
    end
end
