DIRECTIONS = [[-1, 0], [0, -1], [1, 0], [0, 1]]

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  rows, cols = grid.size, grid.first.size
  q, fresh, time = [], 0, 0

  rows.times do |i|
    cols.times do |j|
      case grid[i][j]
      when 1 then fresh += 1
      when 2 then q << [i, j]
      end
    end
  end

  while q.any? && fresh > 0
    q.size.times do
      r, c = q.shift
      DIRECTIONS.each do |dr, dc|
        row, col = r + dr, c + dc
        if row.between?(0, rows - 1) && col.between?(0, cols - 1) && grid[row][col] == 1
          grid[row][col] = 2
          q << [row, col]
          fresh -= 1
        end
      end
    end
    time += 1
  end

  (fresh > 0) ? -1 : time 
end

