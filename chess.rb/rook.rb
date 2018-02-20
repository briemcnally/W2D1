require_relative 'sliding_piece'
require_relative 'piece'
require_relative 'board'

class Rook < Piece

  include SlidingPiece

  def symbol
    "\u2656".encode('utf-8')
  end

  def move_dirs
    [:left, :right, :up, :down]
  end

end

if __FILE__ == $PROGRAM_NAME
  rook = Rook.new([5,5])
  p rook.moves
  p rook.symbol
end
