# o1 solution
class RandomizedSet
    def initialize
        @values = {}
        @vals = []
    end

    def insert(val)
        return false if @values.key?(val)

        @values[val] = @vals.size
        @vals << val
        true
    end

    def remove(val)
        idx = @values[val]
        return false if idx.nil?
        
        if idx == @vals.size - 1
            @vals.pop
        else
            new_val = @vals.pop
            @vals[idx] = new_val
            @values[new_val] = idx
        end
        @values.delete(val)
        true
    end

    def get_random()
        @vals.sample
    end
end

# not o1 solution
class RandomizedSet2
    def initialize
        @values = {}
    end

    def insert(val)
        return false if @values.key?(val)

        @values[val] = true
    end

    def remove(val)
        return false unless @values.key?(val)

        @values.delete(val)
    end

    def get_random()
        @values.keys.sample
    end
end
