# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
    max = (piles.max / (h / piles.size).to_f).ceil
    last_mid = 0
    left, right = 1, max
    while left <= right
        mid = (left + right) / 2
        sum = piles.inject(0) { |sum, pile| sum + (pile / mid.to_f).ceil }
        sum > h ? left = mid + 1 : (last_mid, right = mid, mid - 1)
    end
    last_mid
end
