require_relative 'stepping_piece'
require_relative 'piece'

class King < Piece

  include SteppingPiece

  SETUP_POS = [[0, 4], [7, 4]]

  def self.set_up
    SETUP_POS
  end

  def symbol
    if @color == :white
      " \u2654 ".encode('utf-8')
    else
      " \u265A ".encode('utf-8')
    end
  end

  def move_dirs
    [:left, :right, :up, :down]
  end
end

if __FILE__ == $PROGRAM_NAME
  king = King.new([5,5])
  p king.moves
end
