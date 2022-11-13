# history using stack
class BrowserHistoryStack
    def initialize(homepage)
        @history = [homepage]
        @p_history = []
    end

    def visit(url)
        @history << url
        @p_history = []
    end

    def back(steps)
        steps = @history.length - 1 if steps >= @history.length
        steps.times { @p_history << @history.pop }
        @history[-1]
    end

    def forward(steps)
        steps = @p_history.length if steps > @p_history.length
        steps.times { @history << @p_history.pop }
        @history[-1]
    end
end

# history using Doubly Linked List
class Node
    attr_accessor :val, :prev, :next

    def initialize(val)
        @val = val
        @prev = nil
        @next = nil
    end
end

class BrowserHistory
    def initialize(homepage)
        @root = Node.new(homepage)
    end

    def visit(url)
        node = Node.new(url)
        node.prev = @root
        @root.next = node
        @root = node
    end

    def back(steps)
        steps.times { break unless @root.prev; @root = @root.prev }
        @root.val
    end

    def forward(steps)
        steps.times { break unless @root.next; @root = @root.next }
        @root.val
    end
end
