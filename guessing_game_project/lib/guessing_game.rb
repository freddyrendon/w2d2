class GuessingGame

    def initialize (min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0 
        @game_over = false 
    end 

    def num_attempts
        return @num_attempts
    end 

    def game_over?
        return @game_over
    end

    def check_num(num)
        @num_attempts += 1 
        if num > @secret_num
            print "too big"
        elsif num < @secret_num
            print "too small"
        elsif num == @secret_num
            print "you win"
            @game_over = true 
        end 
    end 

    def ask_user
        print "enter a number"
        user = gets.chomp.to_i
        check_num(user)
    end



end
