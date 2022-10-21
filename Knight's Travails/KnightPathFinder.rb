require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos
        valid = []
       
        (-2..2).each do |i|
            if i != 0 && (x + i) >= 0 && (x + i) < 9
                (-2..2).each do |j|
                    if (y + j) >= 0 && (y + j) < 9 && j != 0 && j != i && i.abs != j.abs

                        valid << [x + i, y + j]
                    end
                end
            end
        end

        valid 
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        # @build_move_tree
    end

    def new_move_positions(pos)
        # if KnightPathFinder.valid_moves(pos) && !@considered_positions.include?(pos)
        #     @considered_positions << pos
        # end

        # pos 
        valid = KnightPathFinder.valid_moves(pos)
         valid.each do |position|
            if @considered_positions.include?(position)
                valid.delete(position)
            end
        end
        p valid 
        valid 
    end


    def build_move_tree
        self.new_move_positions(pos)
    end


end

p KnightPathFinder.valid_moves([5, 5])
p k = KnightPathFinder.new([1,1])
p k.new_move_positions([1,1])