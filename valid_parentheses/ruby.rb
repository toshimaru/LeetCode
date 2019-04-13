def is_valid0(s)
    return false if s.length % 2 > 0
    return true if s.empty?

    if m = s.match(/{(.*?)}/)
        return is_valid(m[1])
    elsif m = s.match(/\((.*?)\)/)
        return is_valid(m[1])
    elsif m = s.match(/\[(.*?)\]/)
        return is_valid(m[1])
    end
    
    false
end

def is_valid(s)
    parentheses = { "(" => ")" , "[" => "]", "{" => "}" }
    stack = []
    s.each_char { |c|
        case c
        when *parentheses.keys
            stack << c
        when *parentheses.values
            next if parentheses[stack.pop] == c
            stack << c
            break
        end
    }
    stack.empty?
end

p is_valid("")
p is_valid("{}")
p is_valid("{]")
p is_valid("{}()")
p is_valid("[()](())")
p is_valid("[(({})}]")
