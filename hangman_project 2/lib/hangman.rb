class Hangman

DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word 
    DICTIONARY.sample
  end 

  def initialize ()
    Hangman.random_word
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5 
  end 

  def guess_word
    return @guess_word
  end 

  def attempted_chars
    return @attempted_chars
  end

  def remaining_incorrect_guesses
    return @remaining_incorrect_guesses
  end 

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end 

  def get_matching_indices(char)
      new_arr = []
      @secret_word.each_char.with_index{ |letter, i | new_arr << i if letter.include?(char)}
      return new_arr
  end 

  def fill_indices(char, array)
      @guess_word.each_with_index do |letter_1, idx_1|
        array.each { |i| @guess_word[idx_1] = char if idx_1 == i}
      end 
  end 

  def try_guess(char)
    fill_indices(char,get_matching_indices(char))

    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)

    if already_attempted?(char) 
      print "that has already been attempted"
      return false 
    else
      @attempted_chars << char
      return true 
    end 
  end

    def ask_user_for_guess
      print "Enter a char:"
      user = gets.chomp
      return try_guess(user)
    end 

    def win?
      if @guess_word.join("") == @secret_word
        print "WIN"
        return true 
      else 
        return false 
      end 
    end 

    def lose?
      if @remaining_incorrect_guesses == 0 
      print "LOSE"
      return true 
      else 
        return false 
      end 
    end 

    def game_over?
      if win? || lose?
        print @secret_word
        return true 
      else 
        return false 
      end 

    end 

end
