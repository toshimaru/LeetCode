# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1

  ary = Array.new(num_rows) { [] }
  s.each_char.with_index do |_s, i|
    div = 2 * num_rows - 2
    q = i % div
    ary[q < num_rows ? q : div - q] << _s
  end
  ary.map(&:join).join
end

p convert("PAYPALISHIRING", 3)
p convert("PAYPALISHIRING", 4)
p convert("A", 1)
p convert("AB", 2)
