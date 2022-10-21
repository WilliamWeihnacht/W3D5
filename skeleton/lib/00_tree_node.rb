require "byebug"

class PolyTreeNode

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent
        @parent
    end

    def parent=(parent)
        if @parent
            @parent.children.delete(self)
        end
        @parent = parent
        if @parent && !@parent.children.include?(self)
            @parent.children << self
        end
    end

    def children
        @children
    end

    def value
        @value
    end

    def add_child(child_node)
        @children << child_node
        child_node.parent=(self)
    end

    def remove_child(child_node)
        if !@children.include?(child_node)
            raise "no such child"
        else
            @children.delete(child_node) 
        end
        child_node.parent=(nil)
    end

    def dfs(target)
        return nil if self == nil
        return self if @value == target 
        @children.each do |child|
            result = child.dfs(target)
            return result unless result == nil
        end
        return nil
    end

    def bfs(target)
        queue = []
        queue << self
        while !queue.empty?
            ele = queue.shift
            return ele if ele.value == target
            ele.children.each do |child|
                queue << child
            end
        end
    end


end