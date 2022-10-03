class MyHashSet
    def initialize()
        @set = {}
    end

    def add(key)
        @set[key] = true
        nil
    end


    def remove(key)
        @set.delete(key)
        nil
    end

    def contains(key)
        @set.key?(key)
    end
end
