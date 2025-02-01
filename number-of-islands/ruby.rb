DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]]

def num_islands1(grid)
    rows, cols = grid.size, grid.first.size
    islands = 0

    dfs = ->(r, c) {
        return if (r < 0 || c < 0 || r >= rows || c >= cols || grid[r][c] == "0")

        grid[r][c] = "0"
        DIRECTIONS.each { |dr, dc| dfs.call(r + dr, c + dc) } 
    }

    rows.times do |r|
        cols.times do |c|
            if grid[r][c] == "1"
                dfs.call(r, c)
                islands += 1
            end
        end
    end

    islands
end


def num_islands2(grid)
    rows, cols = grid.size, grid.first.size
    islands = 0

    bfs = ->(r, c) {
        q = []
        grid[r][c] = "0"
        q << [r, c]

        while q.any?
            row, col = q.shift
            DIRECTIONS.each do |dr, dc|
                nr, nc = row + dr, col + dc
                next if (nr < 0 || nc < 0 || nr >= rows || nc >= cols || grid[nr][nc] == "0")

                q << [nr, nc]
                grid[nr][nc] = "0"
            end
        end
    }

    rows.times do |r|
        cols.times do |c|
            if grid[r][c] == "1"
                bfs.call(r, c)
                islands += 1
            end
        end
    end

    islands
end
