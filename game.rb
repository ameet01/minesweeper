require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def

  def play
    until over?

    end
  end

  def parse_pos(str)
    [str[0].to_i,str[-1].to_i]
  end

  def take_turn
    puts "Enter position: (x,y)"
    position = parse_pos(gets.chomp)
    puts "F"

  end

  def win?
    not_bombs = board.grid.select{|tile| tile.bombed == false}
    not_bombs.all?{|tile| tile.revealed == true}
  end

  def lose?
    bombs = board.grid.select{|tile| tile.bombed == true}
    bombs.any?{|tile| tile.revealed == true}
  end

  def over?
    win? || lose?
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
end
