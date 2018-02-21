require_relative 'sliding_piece'
require_relative 'piece'
require_relative 'board'

class Bishop < Piece

  include SlidingPiece

  SETUP_POS = [[0, 2], [0, 5], [7, 2], [7, 5]]

  def self.set_up
    SETUP_POS
  end

  def symbol
    if @color == :white
      " \u2657 ".encode('utf-8')
    else
      " \u265D ".encode('utf-8')
    end
  end

  def move_dirs
    [:top_left, :top_right, :bottom_left, :bottom_right]
  end
end


if __FILE__ == $PROGRAM_NAME
  bishop = Bishop.new([5,5])
  p bishop.moves
end
