require_relative "piece"
require_relative "nullpiece"
require 'colorize'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    @grid[0].each_index do |idx|
      @grid[0][idx] = Piece.new
    end
    @grid[1].each_index do |idx|
      @grid[1][idx] = Piece.new
    end
    @grid[6].each_index do |idx|
      @grid[6][idx] = Piece.new
    end
    @grid[7].each_index do |idx|
      @grid[7][idx] = Piece.new
    end

  end

  def render(cursor_pos)
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        if cursor_pos == [idx1, idx2]
          print el.to_s.colorize(:red)
        else
          print el
        end
      end
      puts
    end
    puts '-------------------------------'
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  def self.valid_pos?(pos)
    pos[0].between?(0, 7) && pos[-1].between?(0, 7)
  end

  def valid_move?(start_pos, end_pos)
    true
  end

  def move_piece(start_pos, end_pos)
    unless valid_pos?(start_pos) && valid_pos?(end_pos)
      raise ArgumentError.new('This spot doesn\'t exist.')
    end

    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError.new('There is not piece at this spot.')
    end

    if self[end_pos].is_a?(Piece)
      raise ArgumentError.new('There is piece at this spot you want to move to.')
    end

    unless valid_move?(start_pos, end_pos)
      raise ArgumentError.new("This is not a valid move.")
    end

    if self[end_pos].is_a?(NullPiece)
      self[end_pos] = self[start_pos]
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  # p board.grid
  board.render([5,5])

  # p board[[0, 0]].object_id
  # p board.move_piece([5, 5], [0, 3])
  # p board[[0, 3]].object_id
end
