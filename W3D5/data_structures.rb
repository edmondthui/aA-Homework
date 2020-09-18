class Stack
    def initialize
        @stack = Array.new
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[0]
    end
end

class Queue
    def initialize
        @queue = Array.new
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end
end

class Map
    def initialize
        @map = Array.new
    end

    def set(key,value)
        @map.push([key,value]) if @map.count { |ele| ele[0] == key } < 1
    end

    def get(key)
        @map.each do |ele| 
            return ele if ele[0] == key
        end
    end

    def delete(key)
        @map.delete_if { |ele| ele[0] == key }
    end

    def show
        @map.first
    end

end