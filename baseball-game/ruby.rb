# @param {String[]} operations
# @return {Integer}
def cal_points(operations)
    result = []
    while ope = operations.shift
        case ope
        when '+'
            result << result[-1] + result[-2]
        when 'D'
            result << result[-1] * 2
        when 'C'
            result.pop
        else
            result << ope.to_i
        end
    end
    result.sum
end
