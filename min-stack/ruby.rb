class MinStack
    def initialize()
        @stack = []
        @min_stack = []
    end

    def push(val)
        @stack << val
        @min_stack << [@min_stack[-1] || val, val].min
        nil
    end

    def pop()
        @stack.pop
        @min_stack.pop
        nil
    end

    def top()
        @stack[-1]
    end

    def get_min()
        @min_stack[-1]
    end
end

