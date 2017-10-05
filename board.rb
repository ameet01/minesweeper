require_relative 'tile'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    populate
    fill_with_bombs
    render
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    tile = @grid[x][y]
    tile.value = value
  end

  def populate
    @grid.map! { |row| row.map {|col| Tile.new(self,[row,col]) }}
  end

  def fill_with_bombs
    array = []
    until array.length == 27
      x = rand(9)
      y = rand(9)
      array << [x, y] if !array.include?([x, y])
    end
    array.each do |i|
      self[i].bombed = true
    end
  end

  def render
    @grid.each do |i|
      p i
    end
  end
end
