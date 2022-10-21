require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos
        valid = []
       
        (-2..2).each do |i|
            if i != 0 && (x + i) >= 0 && (x + i) < 8
                (-2..2).each do |j|
                    if (y + j) >= 0 && (y + j) < 8 && j != 0 && j != i && i.abs != j.abs

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
        @start_pos = start_pos
        @tree = self.build_move_tree
    end

    def new_move_positions(pos) 
        valid = KnightPathFinder.valid_moves(pos)
         valid.each do |position|
            if @considered_positions.include?(position)
                valid.delete(position)
            else
                @considered_positions << position
            end
        end

        valid 
    end


    def build_move_tree
        self.new_move_positions(pos)
        nod_root = 00_tree_node.new(@start_pos)
        new_moves = new_move_positions(@start_pos)
        new_moves.each do |move|
            node = 00_tree_node.new(move)
            

    end


end

p KnightPathFinder.valid_moves([0, 0])
p k = KnightPathFinder.new([0,0])
p k.new_move_positions([0,0])