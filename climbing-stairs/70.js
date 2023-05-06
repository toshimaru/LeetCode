/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
    let a, b;
   [a, b] = [1, 1]
    for (let i = 0; i < n; i++) {
        [a, b] = [b, a + b];
    }
    return a;
};
