class Board
    attr_reader :board
    def initialize
        @board = Hash.new{|r,c| r[c] = [] }
        c = 1
        while c <= 6
            7.times do
                @board[c].push("\u26ab")
            end
            c += 1
        end
    end
end

Board.new