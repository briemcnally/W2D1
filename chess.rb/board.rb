require_relative "piece"
require_relative "nullpiece"
require_relative "pawn"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "rook"
require_relative "bishop"
require 'colorize'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {} }
    board_setup

  end

  def render(cursor_pos)
    @grid.reverse_each.with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        sym = el.symbol

        if (idx1 + idx2).odd?
          sym = sym.colorize(background: :light_yellow)
        else
          sym = sym.colorize(background: :white)
        end

        if cursor_pos == [idx1, idx2]
          sym.colorize(:red)
        end

        print sym
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

  def in_check?(color)
    #find the pos_king(color)
    king_pos = nil
    @grid.each do |row|
      row.each do |piece|
        if piece.is_a?(King) && piece.color == color
          king_pos = piece.current_pos
        end
      end
    end

    # iterate throught all the pieces of different color and
    # see if their moves array has pos_king
    moves = []
    @grid.each do |row|
      row.each do |piece|
        if (piece.color != color) && !piece.is_a?(NullPiece)
          moves += piece.moves
        end
      end
    end

    moves.include?(king_pos)
  end

  def move_piece(start_pos, end_pos)
    unless Board.valid_pos?(start_pos) && Board.valid_pos?(end_pos)
      raise ArgumentError.new('This spot doesn\'t exist.')
    end

    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError.new('There is not piece at this spot.')
    end

    unless self[end_pos].is_a?(NullPiece)
      raise ArgumentError.new('There is piece at this spot you want to move to.')
    end

    unless valid_move?(start_pos, end_pos)
      raise ArgumentError.new("This is not a valid move.")
    end

    if self[end_pos].is_a?(NullPiece)
      self[end_pos] = self[start_pos]
      self[end_pos].current_pos = end_pos
      self[start_pos] = NullPiece.instance
    end
  end

  private

  def board_setup
    @grid.each_with_index do |row, idx1|
      if [0, 1].include?(idx1)
        color = :white
      elsif [6, 7].include?(idx1)
        color = :black
      end

      row.each_index do |idx2|
        pos = [idx1, idx2]
        if King.set_up.include?(pos)
          self[pos] = King.new(pos, color)
        elsif Queen.set_up.include?(pos)
          self[pos] = Queen.new(pos, color)
        elsif Rook.set_up.include?(pos)
          self[pos] = Rook.new(pos, color)
        elsif Knight.set_up.include?(pos)
          self[pos] = Knight.new(pos, color)
        elsif Bishop.set_up.include?(pos)
          self[pos] = Bishop.new(pos, color)
        elsif [1, 6].include?(idx1)
          self[pos] = Pawn.new(pos, color)
        else
          self[pos] = NullPiece.instance
        end
      end
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.move_piece([1, 5], [2, 5])
  board.move_piece([6, 4], [4, 4])
  board.move_piece([1, 6], [3, 6])
  board.move_piece([7, 3], [3, 7])
  board.render([0, 0])
  p board.in_check?(:white)
  # p board[[0, 0]].object_id
  # p board.move_piece([5, 5], [0, 3])
  # p board[[0, 3]].object_id
end
