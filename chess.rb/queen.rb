require_relative 'sliding_piece'
require_relative 'piece'
require_relative 'board'

class Queen < Piece

  include SlidingPiece

  def symbol
    "\u2654".encode('utf-8')
  end

  def move_dirs
    [:left, :right, :up, :down, :top_left, :top_right, :bottom_left, :bottom_right]
  end

end

if __FILE__ == $PROGRAM_NAME
  queen = Queen.new([5,5])
  p queen.moves
end
