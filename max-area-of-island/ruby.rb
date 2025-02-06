DIRECTIONS = [[-1, 0], [1, 0], [0, -1], [0, 1]]

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
    max_row, max_col = grid.size, grid.first.size
    max_island = 0

    dfs = ->(row, col) {
        return 0 if row < 0 || col < 0 || row >= max_row || col >= max_col || grid[row][col] == 0

        grid[row][col] = 0
        1 + DIRECTIONS.map { |drow, dcol| dfs.call(row + drow, col + dcol) }.sum
    }

    max_row.times do |i|
        max_col.times do |j|
            max_island = [max_island, dfs.call(i, j)].max if grid[i][j] == 1
        end
    end

    max_island
end
