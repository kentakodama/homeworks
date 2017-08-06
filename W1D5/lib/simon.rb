class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
  end

  def take_turn
    show_sequence
    guess = require_sequence
    if @seq == guess
      round_success_message
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    p @seq.dup
  end

  def require_sequence
    input = []
    until input.length == @sequence_length
      p 'enter your colors!'
      input << gets.chomp
    end
    input

  end

  def add_random_color
    color = COLORS.sample
    @seq << color
  end

  def round_success_message
    p "Hey congrats! you got the sequence right!"
  end

  def game_over_message
    p 'sorry dude you fucked up'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end
