require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder

    attr_reader :start_pos, :root_node, :considered_positions

    MOVES = [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
      ]

    def self.valid_moves(pos)
        valid_moves = []
        cur_x, cur_y = pos
        MOVES.each do |(dx, dy)|
            new_pos = [cur_x + dx, cur_y + dy]
            if new_pos.all? { |coord| coord.between?(0, 7) }
                valid_moves << new_pos
            end
        end
        valid_moves
    end

    def initialize(start_pos)
        @considered_positions = [start_pos]
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        build_move_tree
    end

    def new_move_positions(pos) 
        valid = KnightPathFinder.valid_moves(pos)
        new_valid = []
        valid.each do |position|
            if !@considered_positions.include?(position)
                @considered_positions << position
                new_valid<<position
            end
        end
        new_valid 
    end

    def build_move_tree
        queue = []
        queue << @root_node
        until queue.empty?

            ele = queue.shift
            new_moves = new_move_positions(ele.value)
            new_moves.each do |move|
                new_node = PolyTreeNode.new(move)
                ele.add_child(new_node)
                queue << new_node
            end
        end
    end

    def find_path(end_pos)
        return @root_node.bfs(end_pos) 
    end

    def trace_path_back(end_pos)
        arr = [end_pos]
        last = find_path(end_pos)

        current_par = last 
        until current_par.nil?
            current_par = current_par.parent
            arr << current_par.value if current_par
        end

        arr.reverse 
    end


end

