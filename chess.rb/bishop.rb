require_relative 'sliding_piece'
require_relative 'piece'
require_relative 'board'

class Bishop < Piece

  include SlidingPiece

  def symbol
    "\u2657".encode('utf-8')
  end

  def move_dirs
    [:top_left, :top_right, :bottom_left, :bottom_right]
  end
end


if __FILE__ == $PROGRAM_NAME
  bishop = Bishop.new([5,5])
  p bishop.moves
end
