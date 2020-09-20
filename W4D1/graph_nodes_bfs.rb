require "set"

class GraphNode

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(arr)
        @neighbors = arr
    end

    def value
        @value
    end

    def neighbors
        @neighbors
    end

end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited_set = Set.new()

    until queue.empty?
        node = queue.shift
        puts node.value
        return node if node.value == target_value 

        node.neighbors.each do |node|
            break if visited_set.include?(node)
            return node if node.value == target_value
            visited_set.add(node)
            queue << node
        end
    end
    nil
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")