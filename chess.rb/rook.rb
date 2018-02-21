require_relative 'sliding_piece'
require_relative 'piece'
require_relative 'board'

class Rook < Piece

  include SlidingPiece

  SETUP_POS = [[0, 0], [0, 7], [7, 0], [7, 7]]

  def self.set_up
    SETUP_POS
  end

  def symbol
    if @color == :white
      " \u2656 ".encode('utf-8')
    else
      " \u265C ".encode('utf-8')
    end
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
