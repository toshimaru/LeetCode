ROMANS_TO_NUM = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }.freeze

def roman_to_int(s)
  s.length.times.inject(0) do |sum, i|
    current_num = ROMANS_TO_NUM[s[i]]
    next_num = ROMANS_TO_NUM[s[i+1]].to_i
    sum += current_num < next_num ? -current_num : current_num
  end
end

puts roman_to_int "III"
puts roman_to_int "IV"
