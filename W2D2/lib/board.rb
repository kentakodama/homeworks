require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @p1 = name1
    @p2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)

    raise 'Invalid starting cup' unless start_pos.between?(1, 14)

  end

  def make_move(start_pos, current_player_name)
    skip = nil
    if start_pos.between?(0, 5)
      skip = 13
    else
      skip = 6
    end

    @in_hand = @cups[start_pos]
    @cups[start_pos]

    current_pos = start_pos
    until @in_hand.empty?
      current_pos += 1
      current_pos = current_pos % 14
      if current_player_name == @p1 && current_pos == 13
        next
      elsif current_player_name == @p2 && current_pos == 6
        next
      else
        @cups[current_pos] << @in_hand.shift
      end
    end
    render

    next_turn(current_pos)


  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?{|cup| cup.empty?}
  end

  def winner
    #return :draw if @cups[6].length == @cups[13].length
    player_one_count = @cups[6].count
    player_two_count = @cups[13].count

    case player_one_count <=> player_two_count
    when 1
      return @p1
    when -1
      return @p1
    when 0
      return :draw
    end
  end

end
