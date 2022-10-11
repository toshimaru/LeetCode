/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
    const stack = []
    const map = { ')': '(', ']': '[',  '}': '{' }
    
    for(const char of s) {
        switch (char) {
          case '(':
          case '[':
          case '{':
                stack.push(char)
                break;
          default:
                if (map[char] === stack[stack.length - 1])
                    stack.pop()
                else
                    return false
        }
    }

    return stack.length == 0
};
