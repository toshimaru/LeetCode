# @param {Integer} n
# @return {String}
def count_and_say(n)
  return '1' if n == 1

  word, chars = count_and_say(n - 1), []
  word.size.times.each_with_object("") do |i, str|
    chars << word[i]
    next if word[i] == word[i + 1]

    str << chars.size.to_s << word[i]
    chars = []
  end
end

puts count_and_say(1)
puts count_and_say(2)
puts count_and_say(3)
puts count_and_say(4)
puts count_and_say(5)
