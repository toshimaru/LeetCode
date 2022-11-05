class BrowserHistory
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
