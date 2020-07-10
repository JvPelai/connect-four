class Player
    attr_accessor :pieces
    def initialize
        @pieces = ["\u2648","\u264a","\u264c","\u264d","\u2650","\u2652"]
        puts "What will be your player name?","\n"
        @name = gets.chomp
        puts "\n"
        @piece = choose_piece
    end

    def choose_piece
        puts "Press the corresponding number to choose the piece you want to play with: \n"
        puts "\n"
        @pieces.each_with_index do |piece, index|
            puts "#{index + 1} - #{piece}"
        end
        i = gets.chomp.to_i
        piece = @pieces[i-1]
        @pieces.delete(piece)
        piece
    end

    def piece
        @piece 
    end
    def name
        @name
    end
end