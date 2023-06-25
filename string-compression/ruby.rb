# @param {Character[]} chars
# @return {Integer}
def compress(chars)
    walker, runner = 0, 0

    while runner < chars.size
        chars[walker] = chars[runner]
        count = 1
        while chars[runner] == chars[runner + 1]
            runner += 1
            count += 1
        end
        if count > 1
            count.to_s.each_char do |c|
                chars[walker += 1] = c
            end
        end
        runner += 1
        walker += 1
    end

    walker
end
