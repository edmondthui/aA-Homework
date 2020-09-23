require 'colorize'

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
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !game_over
      round_success_message
    end
    self.sequence_length += 1

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      symbol = color.to_sym
      puts "--------------------"
      puts "Simon says #{color}".colorize(symbol)
      puts "--------------------"
      sleep 1
      system("clear")
      sleep 0.1
    end
  end

  def require_sequence
    puts "Follow what Simon says... Type the first letter of each color for as long as you can!"
    seq.each do |color|
      input = gets.chomp
      if input != color[0]
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Success! Next sequence:"
  end

  def game_over_message
    puts "Nice try! Game over you made it #{sequence_length-1} turns!"
  end

  def reset_game
    self.seq = []
    self.sequence_length = 1
    self.game_over = false
    nil
  end
end
