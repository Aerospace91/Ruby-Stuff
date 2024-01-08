# Game Class to handle overarching game logic
class Game

    def initialize
        @player1 = 'Player 1'
        @player2 = 'Player 2'
        @current_player = @player1
        @board = Array.new(3) { Array.new(3, ' ') }
        @winner = false
        @turn = Random.rand(1..2)
    end

    private
    def turn_change
        @turn += 1
        if @turn % 2 == 0
            @current_player = @player1
        elsif @turn % 2 == 1
            @current_player = @player2
        end
    end

    private
    def calculate_winner
        # 3 in a row
        @board.any? do |row|
            return @player1 if row.all? { |cell| cell == :x }
            return @player2 if row.all? { |cell| cell == :o }
        end

        # 3 in a column
        @board.transpose.any? do |column|
            return @player1 if column.all? { |cell| cell == :x }
            return @player2 if column.all? { |cell| cell == :o }
        end

        # 3 in a diagonal
        diagonals = [
            [@board[0][0], @board[1][1], @board[2][2]],
            [@board[0][2], @board[1][1], @board[2][0]]
        ]
        diagonals.any? do |diagonal|
            return @player1 if diagonal.all? { |cell| cell == :x }
            return @player2 if diagonal.all? { |cell| cell == :o }
        end
        return false
    end

    private
    def make_move(number)
        case number
        when 1
            row = 0
            column = 0
        when 2
            row = 0
            column = 1
        when 3
            row = 0
            column = 2
        when 4
            row = 1
            column = 0
        when 5
            row = 1
            column = 1
        when 6
            row = 1
            column = 2
        when 7
            row = 2
            column = 0
        when 8
            row = 2
            column = 1
        when 9
            row = 2
            column = 2
        end

        if @board[row][column] == ' '
            @board[row][column] = @current_player == @player1 ? :x : :o
        else
            puts 'Invalid move. Try again.'
        end
    end


    private
    def display_board
        puts ' 1 | 2 | 3 '
        puts ' 4 | 5 | 6 '
        puts ' 7 | 8 | 9 '
        puts '-------------'
        @board.each do |row|
            row.each_with_index do |cell, index|
                if cell == :o
                    print ' O '
                elsif cell == :x
                    print ' X '
                else
                    print ' _ '
                end
                if index < 2
                    print '|'
                end
            end
            puts
        end
    end

    public
    def play_game()
        puts "Game Start between #{@player1} and #{@player2}!"
        until @winner != false do
            display_board
            puts @current_player == @player1 ? "#{@player1}'s turn!" : "#{@player2}'s turn!"
            next_move = gets.chomp.to_i
            if next_move > 9 || next_move < 1
                invalid_input
                next
            end
            move = make_move(next_move)
            unless move
                next
            end

            @winner = calculate_winner
            unless @winner == false
                puts "#{@winner} wins!"
                display_board
            end
            turn_change
        end
    end

    private
    def invalid_input
        puts 'Invalid input.'
    end

    private
    def invalid_move
        puts 'Invalid move. Please choose an empty cell.'
    end

end

game = Game.new
game.play_game