def is_anagram(s, t)
    return false if s.size != t.size

    scounter = Hash.new { |hash, key| hash[key] = 0 }
    tcounter = Hash.new { |hash, key| hash[key] = 0 }
    (0..s.size).each do |i|
        scounter[s[i]] += 1
        tcounter[t[i]] += 1
    end
    scounter == tcounter
end

def is_anagram1(s, t)
    s.chars.tally == t.chars.tally  
end

