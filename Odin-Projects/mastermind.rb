# frozen_string_literal: true

# Game Class handling overarching game logic
class Game
    def initialize
        puts "Welcome to Mastermind!"
        puts "Please enter your name:"
        @board = ''
        @player1 = gets.chomp
        @winner = false
        @code = generate_code
    end

    private
    def generate_code
        code = []
        4.times do
            code.push(rand(6) + 1)
        end
        code
    end

    private
    def take_turn
        puts "Please enter your guess:"
        @move = gets.chomp.split('').map(&:to_i)
    end

    private
    def give_clues
        clues = []
        code_copy = @code.dup
        @move.each_with_index do |guess, index|
            if guess == code_copy[index]
                clues.push('X')
                code_copy[index] = nil
            end
        end
        @move.each_with_index do |guess, index|
            if code_copy.include?(guess)
                clues.push('O')
                code_copy[code_copy.index(guess)] = nil
            end
        end
        clues.fill('_', clues.length...@move.length)
        clues
    end

    private
    def check_guess
        if @move == @code
            @winner = true
            puts "Congratulations #{@player1}! You guessed the code!"
        else
            puts "Sorry, that's not the code. Try again!"
        end
    end
                

    public
    def get_code
        @code
    end

    public
    def get_move
        while @winner == false do
            take_turn
            p give_clues
            check_guess
        end
    end
end

game = Game.new
p game.get_code
p game.get_move
