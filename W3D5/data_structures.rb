class Stack
    def initialize
        @stack = Array.new
    end

    def push(el)
        stack.push(el) # use getter to access the array instead of referencing ivar, because instance variables fail silently and methods fail loudly
        el
    end

    def pop
        stack.pop
    end

    def peek
        stack.last
    end

    private # we don't want the user to accidentally access this array and mutate it
    attr_reader :stack

end

class Queue
    def initialize
        @queue = Array.new
    end

    def enqueue(el)
        queue.push(el)
        el
    end

    def dequeue
        queue.shift
    end

    def peek
        queue.first
    end

    private # we don't want the user to accidentally access this array and mutate it
    attr_reader :queue

end

class Map
    def initialize
        @map = Array.new
    end

    def set(key,value)
        map.push([key,value]) if map.count { |ele| ele[0] == key } < 1
    end

    def get(key)
        map.each do |ele| 
            return ele if ele[0] == key
        end
    end

    def delete(key)
        map.delete_if { |ele| ele[0] == key }
    end

    def show
        deep_dup(map)
    end

    private # we don't want the user to accidentally access this array and mutate it
    attr_reader :map

end