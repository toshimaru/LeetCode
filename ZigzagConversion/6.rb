# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1 || s.length < num_rows

  ary = Array.new(num_rows) { "" }
  div = 2 * num_rows - 2
  s.each_char.with_index do |c, i|
    q = i % div
    ary[q < num_rows ? q : div - q] << c
  end
  ary.join
end

def convert2(s, num_rows)
  return s if s.size < num_rows || num_rows <= 1

  idxs = (1..num_rows).to_a + (2...num_rows).to_a.reverse
  ary = Array.new(num_rows) { "" }
  s.each_char.with_index do |c, i|
    ary[idxs[i % idxs.size] - 1] << c
  end
  ary.join
end

p convert("PAYPALISHIRING", 3)
p convert("PAYPALISHIRING", 4)
p convert("A", 1)
p convert("AB", 2)

p convert2("PAYPALISHIRING", 3)
p convert2("PAYPALISHIRING", 4)
p convert2("A", 1)
p convert2("AB", 2)

########################

require 'benchmark/ips'

Benchmark.ips do |x|
    x.report("convert") {
      convert("PAYPALISHIRING", 3)
      convert("PAYPALISHIRING", 4)
      convert("PAYPALISHIRINGPAYPALISHIRING", 5)
      convert("A", 1)
      convert("AB", 2)
    }
    x.report("convert2") {
      convert2("PAYPALISHIRING", 3)
      convert2("PAYPALISHIRING", 4)
      convert2("PAYPALISHIRINGPAYPALISHIRING", 5)
      convert2("A", 1)
      convert2("AB", 2)
    }
    x.compare!
end
