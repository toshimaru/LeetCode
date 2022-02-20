# @param {String} s
# @return {Integer}
def length_of_longest_substring1(s)
    return s.length if s.length < 2

    str = ""
    max = 1
    s.each_char do |c|
        index = str.index(c)
        unless index.nil?
            max = [str.length, max].max
            str.slice!(..index)
        end
        str << c
    end
    [str.length, max].max
end

def length_of_longest_substring2(s)
    return s.length if s.length < 2
    
    queue = []
    s.each_char.reduce(0) do |max, c|
        while queue.include?(c)
            char = queue.shift
            queue.delete(char)
        end
        
        queue << c
        [max, queue.size].max
    end
end

def length_of_longest_substring2x(s)
    return s.length if s.length < 2

    queue = []
    s.each_char.reduce(1) do |max, c|
        while queue.include?(c)
            char = queue.shift
            queue.delete(char)
        end
        
        queue << c
        queue.size > max ? queue.size : max
    end
end

def length_of_longest_substring2y(s)
    return s.length if s.length < 2

    queue = []
    max = 1
    s.each_char do |c|
        while queue.include?(c)
            char = queue.shift
            queue.delete(char)
        end
        
        queue << c
        max = queue.size if queue.size > max
    end
    max
end

def length_of_longest_substring3(s)
    return s.length if s.length < 2
    
    hash = {}
    s.each_char.reduce(0) do |max, c|
        while hash.key?(c)
            char = hash.shift.first
            hash.delete(char)
        end
        
        hash[c] = c
        [max, hash.size].max
    end
end

def length_of_longest_substring3x(s)
    return s.length if s.length < 2
    
    hash = {}
    max = 1
    s.each_char do |c|
        while hash.key?(c)
            char = hash.shift.first
            hash.delete(char)
        end
        
        hash[c] = c
        max = hash.size if hash.size > max
    end
    max
end

# s = "bbbbb"
# puts length_of_longest_substring2x(s)

# s = "pwwkew"
# puts length_of_longest_substring(s)

# s = "au"
# puts length_of_longest_substring(s)

# s = "dvdf"
# puts length_of_longest_substring(s)

require 'benchmark/ips'

Benchmark.ips do |x|
    s1 = "pwwkew"
    s2 = "abcdefghijklmnaxyz"
    s3 = "bbbbbbb"
    x.report("length_of_longest_substring1") {
        length_of_longest_substring1(s1)
        length_of_longest_substring1(s2)
        length_of_longest_substring1(s3)
    }
    x.report("length_of_longest_substring2") {
        length_of_longest_substring2(s1)
        length_of_longest_substring2(s2)
        length_of_longest_substring2(s3)
    }
    x.report("length_of_longest_substring2x") {
        length_of_longest_substring2x(s1)
        length_of_longest_substring2x(s2)
        length_of_longest_substring2x(s3)
    }
    x.report("length_of_longest_substring2y") {
        length_of_longest_substring2y(s1)
        length_of_longest_substring2y(s2)
        length_of_longest_substring2y(s3)
    }
    x.report("length_of_longest_substring3") {
        length_of_longest_substring3(s1)
        length_of_longest_substring3(s2)
        length_of_longest_substring3(s3)
    }
    x.report("length_of_longest_substring3x") {
        length_of_longest_substring3x(s1)
        length_of_longest_substring3x(s2)
        length_of_longest_substring3x(s3)
    }
    x.compare!
end
