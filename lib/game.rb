
class Game
    attr_accessor :gameboard
    attr_accessor :spots_left
    def initialize
        @player1 = Player.new
        @player2 = Player.new
        @gameboard = Board.new.board
        @spots_left = 42
        match(@player1,@player2)
    end
    
    def match(player1,player2)
        @match_going = true
        while @match_going == true
            player_move(player1)
            check_board(player1)
            return new_match? if @match_going == false
            player_move(player2)
            check_board(player2)
            return new_match? if @match_going == false
        end
    end
    
    def board_display
        puts "\n"
        puts " | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
        @gameboard.each do |row,spots|
            print " | " + spots.join(" | ") + " | ", "\n"
        end
    end

    def player_move(player)
        puts "It's #{player.name}'s turn!!!", "\n"
        puts "Select a column to drop your piece"
        puts "\n"
        board_display
        column = gets.chomp.to_i
        #row = @gameboard.length.to_i
        if @gameboard[6][column-1] == "\u26ab"
            @gameboard[6][column-1] = player.piece
        elsif @gameboard[5][column-1] == "\u26ab"
            @gameboard[5][column-1] = player.piece
        elsif @gameboard[4][column-1] == "\u26ab"
            @gameboard[4][column-1] = player.piece
        elsif @gameboard[3][column-1] == "\u26ab"
            @gameboard[3][column-1] = player.piece
        elsif @gameboard[2][column-1] == "\u26ab"
            @gameboard[2][column-1] = player.piece
        elsif @gameboard[1][column-1] == "\u26ab"
            @gameboard[1][column-1] = player.piece
        else
            puts "Column is full", "\n"
            player_move(player)
        end
        @spots_left -= 1
        @gameboard
    end

    def check_board(player)
        check_vertical(player)
        check_horizontal(player)
        check_left_diag(player)
        check_right_diag(player)
    end

    def check_vertical(player)
        0.upto(7) do |column|
            1.upto(3) do |row|
                if @gameboard[row][column] == player.piece  && @gameboard[row+1][column] == player.piece && @gameboard[row+2][column] == player.piece && @gameboard[row+3][column] == player.piece
                    @gameboard[row][column] = "\u26aa"
                    @gameboard[row+1][column] = "\u26aa"
                    @gameboard[row+2][column] = "\u26aa"
                    @gameboard[row+3][column] = "\u26aa"
                    @match_going = false
                    puts "Congratulations #{player.name}, you win!"  
                end
            end
        end
    end 
    
    def check_horizontal(player)
        1.upto(6) do |row|
            0.upto(3) do |column|
                if @gameboard[row][column] == player.piece && @gameboard[row][column+1] == player.piece && @gameboard[row][column+2] == player.piece && @gameboard[row][column+3] == player.piece
                    @gameboard[row][column] = "\u26aa"
                    @gameboard[row][column+1] = "\u26aa"
                    @gameboard[row][column+2] = "\u26aa"
                    @gameboard[row][column+3] = "\u26aa"
                    @match_going = false
                    puts "Congratulations #{player.name}, you win!"
                end
            end
        end
    end

    def check_left_diag(player)
        1.upto(3) do |row|
            0.upto(3) do |column|
                if @gameboard[row][column] == player.piece && @gameboard[row+1][column+1] == player.piece && @gameboard[row+2][column+2] == player.piece && @gameboard[row+3][column+3] == player.piece
                    @gameboard[row][column] = "\u26aa"
                    @gameboard[row+1][column+1] = "\u26aa"
                    @gameboard[row+2][column+2] = "\u26aa"
                    @gameboard[row+3][column+3] = "\u26aa"
                    @match_going = false
                    puts "Congratulations #{player.name}, you win!"
                end
            end
        end
    end

    def check_right_diag(player)
        1.upto(3) do |row|
            6.downto(3) do |column|
                if @gameboard[row][column] == player.piece && @gameboard[row+1][column-1] == player.piece && @gameboard[row+2][column-2] == player.piece && @gameboard[row+3][column-3] == player.piece
                    @gameboard[row][column] = "\u26aa"
                    @gameboard[row+1][column-1] = "\u26aa"
                    @gameboard[row+2][column-2] = "\u26aa"
                    @gameboard[row+3][column-3] = "\u26aa"
                    @match_going = false
                    puts "Congratulations #{player.name}, you win!", "\n"
                end
            end
        end
    end

    def new_match?
        board_display
        puts "\n"
        puts "Do you wish to play again?"
        puts "1 - Yes / 2 - No"
        ans = gets.chomp.to_i
        if ans == 1
            Game.new
        end
    end

end