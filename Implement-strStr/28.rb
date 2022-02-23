def str_str(haystack, needle)
    haystack.index(needle) || -1
end

haystack = "hello"
needle = "ll"
puts str_str(haystack, needle) 
