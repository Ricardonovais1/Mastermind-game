class mastermind

    def initialize(start)
        @start = start
        @colors = ['blue', 'white', 'pink', 'yellow', 'green', 'red']
        @count_guesses = 0
    end

    def start_match
        if @start == 'Y' || @start == 'y'
            get_random_combination()
        elsif @start == 'N' || @start == 'n'
            abort("See you soon!")
        end        
    end

    def get_random_combination 
        @secret_combo = @colors.shuffle[0..3]
        # p @secret_combo
        count_guesses()
    end 

    def count_guesses
        @count_guesses += 1
        if @count_guesses < 12 
            ask_for_guess()
        else 
            abort("GAME OVER - SUAS 12 CHANCES FORAM USADAS")
        end
    end

    def ask_for_guess()
        p "Write your guess ##{@count_guesses}, apenas separando cada cor por espaços (choose 4 colors from Blue, White, Pink, Yellow, Green and Red)"
        @guess = gets.chomp 
        @guess = @guess.split(' ')
        puts "You guess ##{@count_guesses} is: #{@guess}"
        check_win(@guess)
    end

    def check_win(array)
        if array == @secret_combo
            abort('YOU WON!!')
        else 
            get_system_feedback(array)
        end

    end

    def get_system_feedback(guess)

        @guess.each_with_index do |color, i|
            @secret_combo.each_with_index do |col, j|
                if @secret_combo.include?(color) && @guess.index(color) == @secret_combo.index(color)
                    p 'BLACK'
                    break
                elsif @secret_combo.include?(color) && @guess.index(color) != @secret_combo.index(color)
                    p 'WHITE'
                    break
                elsif @secret_combo.none? { |col| col == color }
                    p ''
                    break
                end
            end
        end
        count_guesses()
    end
end

p "Welcome to Martermind Land! Wanna start a new match? Y/N"
answer = gets.chomp
mastermind = Master.new(answer)
mastermind.start_match()







