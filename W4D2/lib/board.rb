class Board
  attr_accessor :cups

  attr_reader :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new()}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 0
    raise "Starting cup is empty" if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    stones_in_cup = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    
    while !stones_in_cup.empty?
      i += 1
      i = 0 if i > 13
      if current_player_name == @name1
        next if i == 13
        @cups[i] << stones_in_cup.shift
      elsif current_player_name == @name2 
        next if i == 6
        @cups[i] << stones_in_cup.shift
      else
        @cups[i] << stones_in_cup.shift
      end
    end

    render
    next_turn(i)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[1..6].all? {|cup| cup == []}
    return true if @cups[7..12].all? {|cup| cup == []}
    false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return name1
    else
      return name2
    end
  end
end
