# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
    a, b, c = [], [], []
    9.times do |i|
        row = []
        col = []
        9.times do |j|
            row << board[i][j]
            col << board[j][i]
        end
        return false unless valid?(row)
        return false unless valid?(col)

        a += row[0..2]
        b += row[3..5]
        c += row[6..8]

        if (i + 1) % 3 == 0
            return false unless valid?(a)
            return false unless valid?(b)
            return false unless valid?(c)
            a, b, c = [], [], []
        end
    end
    true
end

def valid?(ary)
    ary.each_with_object({}) do |a, obj|
        next if a == "."
        return false unless obj[a].nil?
        obj[a] = true
    end
    true
end

p is_valid_sudoku([[".",".",".",".",".",".","5",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".",".","."],["9","3",".",".","2",".","4",".","."],[".",".","7",".",".",".","3",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".","3","4",".",".",".","."],[".",".",".",".",".","3",".",".","."],[".",".",".",".",".","5","2",".","."]])

# puts true
# p is_valid([1])
# p is_valid([1,2,3])
# p is_valid([1,2,3,'.'])
# p is_valid([1,2,3,'.','.'])

# puts false
# p is_valid([1,1]) 
# p is_valid([1,2,2])
