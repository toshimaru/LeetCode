# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
    cnt = 0
    while s = students.shift
        if s == sandwiches[0]
            sandwiches.shift
            cnt = 0
        else
            students << s
            cnt += 1
            break if cnt > students.length
        end
    end
    students.length
end

# simpler logic
def count_students2(students, sandwiches)
  students = students.tally
  sandwiches.each do |type|
    break if (students[type] || 0).zero?
    students[type] -= 1
  end
  students.values.sum
end
