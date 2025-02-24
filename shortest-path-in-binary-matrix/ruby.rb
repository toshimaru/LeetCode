DIRECTIONS = [
    [-1,-1], [-1,0], [-1,1],
    [ 0,-1],         [ 0,1],
    [ 1,-1], [ 1,0], [ 1,1],
]

# BFS approach
# @param {Integer[][]} grid
# @return {Integer}
def shortest_path_binary_matrix(grid)
    n = grid.size
    return -1 if grid[0][0] > 0 || grid[n-1][n-1] > 0

    q = [[0, 0, 1]]
    grid[0][0] = 1

    while q.any?
        r, c, len = q.shift
        return len if r == n-1 && c == n-1

        DIRECTIONS.each do |dr, dc|
            nr, nc = r+dr, c+dc
            if nr.between?(0, n-1) && nc.between?(0, n-1) && grid[nr][nc] == 0
                grid[nr][nc] = 1
                q.push([nr, nc, len+1])
            end
        end
    end

    -1
end

