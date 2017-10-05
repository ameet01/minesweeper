require_relative 'board'

class Tile
  attr_accessor :revealed, :value, :flagged, :bombed, :board, :x_position, :y_position

  def initialize(board,position)
    @revealed = false
    @board = board
    @bombed = false
    @flagged = false
    @x_position = position[0]
    @y_position = position[1]
  end

  def neighbor_bomb_count
    neighbors.select{|neighbor| neighbor.bombed == true}.count
  end

  def reveal
    @revealed = true
  end

  #return array of neighboring tile objects
  def neighbors
    neighboring = []
    neighboring << @board[x_position,y_position+1] if @board[x_position,y_position+1].is_a?(Tile)
    neighboring << @board[x_position,y_position-1] if @board[x_position,y_position-1].is_a?(Tile)
    neighboring << @board[x_position+1,y_position+1] if @board[x_position+1,y_position+1].is_a?(Tile)
    neighboring << @board[x_position-1,y_position+1] if @board[x_position-1,y_position+1].is_a?(Tile)
    neighboring << @board[x_position+1,y_position-1] if @board[x_position+1,y_position-1].is_a?(Tile)
    neighboring << @board[x_position-1,y_position-1] if @board[x_position-1,y_position-1].is_a?(Tile)
    neighboring << @board[x_position+1,y_position] if  @board[x_position+1,y_position].is_a?(Tile)
    neighboring << @board[x_position-1,y_position] if @board[x_position-1,y_position].is_a?(Tile)

    neighboring

  end

end
