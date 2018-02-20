require_relative 'stepping_piece'
require_relative 'piece'
require_relative 'board'

class King < Piece

  include SteppingPiece

  def symbol
    "\u2654".encode('utf-8')
  end

  def move_dirs
    [:left, :right, :up, :down]
  end
end

if __FILE__ == $PROGRAM_NAME
  king = King.new([5,5])
  p king.moves
end
